module Refinery
  module PlanByFormats
    class PlanByFormat
      attr_reader :demographics, :active

      def initialize planning_data
        Rails.logger.info "----00000 Initialise"
        @planning_params = planning_data
        process_demographics
        Rails.logger.info "----00000 Initialise (finish)"
      end

      def process_demographics
        Rails.logger.info "----00000 process_demographics (start)"

        demographic_ids = @planning_params["demographics"]
        demos = demographic_ids.keys.sort.map { |id| demographic_ids[id].to_i }
        demos.delete(0)
        @demographics = demos.map do |id|
          Rails.logger.info "----00000 process_demographics (loop)"

          PBFDemographic.new id, @planning_params["markets"]
        end
        Rails.logger.info "----00000 process_demographics (mid)"
        @active = !@demographics.first.nil? && !@demographics.first.markets.empty?
      end

      def process
        Rails.logger.info "Start Process"
        if @active
          @demographics.each do |demographic|
            demographic.markets.each do |market|
              market.formats.each do |format|
                format.fill_data demographic.id, market.id, market.region_code
                market.accumulate_totals format

                format.smbap_format.smbap_contacts format.contacts
                format.smbap_format.smbap_reach_persons format.reach_persons
                demographic.smbap.accumulate_totals format
              end
              demographic.smbap.calc_reach_persons_and_ market
            end
            demographic.smbap.calculate
          end
        end
      end
    end

    class PBFDemographic
      attr_reader :id, :markets, :smbap

      def initialize id, market_params
        @id = id
        @market_params = market_params
        process_markets
      end

      def process_markets
        market_ids = @market_params.keys.map { |item| item.to_i }.sort {|x, y| ::Selection.find(x).position_value <=> ::Selection.find(y).position_value}
        @markets = market_ids.map do |id|
          Rails.logger.info "---=== process market loop"
          PBFMarket.new id, @market_params[id.to_s]
        end.find_all { |market| market.active }
        @smbap = PBFsmbap.new @markets # 0, @market_params
      end

      def name
        name_common @id
      end

      def market obj
        if obj.nil?
          @smbap
        else
          pos  = @markets.map(& :id).index(obj.id)
          @markets[pos]
        end
      end

      def active?
        !markets.empty?
      end

      def name_common id
        item = Selection.find_by_id(id)
        item.name if item
      end
    end

    class PBFMarket
      attr_reader :id, :region_code, :formats, :contacts, :reach, :reach_persons, :avg_freq

      def initialize id, items
        @id = id
        @region_params = items["regions"]
        @formats_params = items["formats"]
        process_regions
        process_formats
        @contacts, @reach, @reach_persons, @avg_freq = [0, 0, 0, 0] #duplicated
      end

      def process_regions
        @regions = @region_params.map { |region| region.to_i }.sort
        #@region_code = @regions.inject(0) { |region_code_acc, region_id| region_code_acc + 2**(region_id-@id-1) }
      end

      def process_formats
        format_ids = @formats_params.keys.map { |item| item.to_i }.sort
        @formats = format_ids.map { |id| PBFFormat.new id, @formats_params[id.to_s] }.find_all { |format| format.active }
      end

      def active
        !@regions.empty? && !formats.empty?
      end

      def accumulate_totals child_format
        @contacts += child_format.contacts
        @reach = aim @reach, child_format.reach

        @avg_freq = safe_divide(@contacts, ((@reach)*child_format.region_pop))
        @reach_persons = @reach * child_format.region_pop
      end

      def aim value1, value2
        (1- ((1-(value1)) * (1-(value2))))
      end

      def format_ids
        @formats.map &:id
      end

      def name
        name_common @id
      end

      def format obj
        pos  = format_ids.index(obj.id)
        @formats[pos]
      end

      def total_population
        formats.first.region_pop
      end

      def market_display
        Selection.find(@id).name
      end

      def regions_display
        @regions.map {|region| Selection.find(region).name}.join("; ")
      end

      def name_common id
        item = Selection.find_by_id(id)
        item.name if item
      end

      def safe_divide val1, val2
        if val2 == 0
          0
        else
          val1 / val2
        end
      end

    end

    class PBFsmbap #< PBFMarket
      attr_reader :id, :formats, :contacts, :reach, :reach_persons, :avg_freq, :total_population

      def initialize markets
        @formats = []
        markets.each do |market|
          market.formats.each do |format|
            smbap_format = @formats.find { |format_find| format_find.id == format.id }
            (@formats << smbap_format = PBFFormat.new(format.id)) unless smbap_format
            format.smbap_format = smbap_format
          end
        end
        @formats.sort! { |x, y| x.id <=> y.id }
        @contacts, @reach, @reach_persons, @avg_freq = [0, 0, 0, 0] #duplicated
      end

      def format_ids
        @formats.map &:id
      end

      def accumulate_totals child_format
        @contacts += child_format.contacts
      end


      def calc_reach_persons_and_ market
        @reach_persons = @reach_persons + market.reach_persons
        @total_population = @total_population.to_i + market.formats.first.region_pop
      end

      def calculate
        @reach = safe_divide(@reach_persons.to_f, @total_population)
        @avg_freq = safe_divide(contacts, @reach_persons)
        @formats.each do |format|
          format.smbap_calc_reach self
        end
      end

      def format obj
        pos  = format_ids.index(obj.id)
        @formats[pos]
      end

      def safe_divide val1, val2
        if val2 == 0
          0
        else
          val1 / val2
        end
      end
    end

    class PBFFormat
      attr_reader :id, :duration, :weight, :data, :contacts, :reach, :reach_persons, :avg_freq, :region_pop
      attr_accessor :smbap_format, :id

      def initialize id, items=nil
        @id = id
        if items
          @params = items
          process_duration
          process_weight
        end
        @contacts, @reach, @reach_persons, @avg_freq, @region_pop = [0, 0, 0, 0, 0] #duplicated
      end

      def process_duration
        @duration = @params["duration"].to_i
      end

      def process_weight
        @weight = @params["weight"].to_i
      end

      def active
        @weight != 0 && !@weight.nil?
      end

      def fill_data demographic_id, market_id, region_code
        @data = Audience.find_by_market_id_and_region_code_and_format_id_and_weight_and_demog_id_and_duration(market_id, region_code, @id, @weight, demographic_id, @duration)
        if @data
          @contacts = @data.contacts
          @reach = @data.reach/100
          @reach_persons = @data.reach_persons
          @avg_freq = @data.avg_freq
          @region_pop = @data.region_pop
        end
      end

      def smbap_contacts contacts
        @contacts = @contacts.to_i + contacts
      end

      def smbap_reach_persons reach_persons
        @reach_persons = @reach_persons.to_i + reach_persons
        @avg_freq = safe_divide(@contacts.to_f, @reach_persons)
      end

      def smbap_calc_reach smbap
        @reach = safe_divide(@reach_persons.to_f, smbap.total_population)

      end

      def name
        name_common @id
      end

      def safe_divide val1, val2
        if val2 == 0
          0
        else
          val1 / val2
        end
      end

      def name_common id
        item = Selection.find_by_id(id)
        item.name if item
      end
    end

    #def safe_divide val1, val2
    #  if val2 == 0
    #    0
    #  else
    #    val1 / val2
    #  end
    #end

    #def name_common id
    #  item = Selection.find_by_id(id)
    #  item.name if item
    #end
  end
end
