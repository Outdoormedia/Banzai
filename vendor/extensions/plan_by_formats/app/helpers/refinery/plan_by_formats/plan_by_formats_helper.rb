module Refinery
  module PlanByFormats
    module PlanByFormatsHelper
        def get_planning_data *values
          data = session[:planning_data]
          for value in values
            break if data.nil?
            data = data[value.to_s]
          end
          data
        end

        def clear_region_totals
          @contacts_total = {}
          @reach_total = {}
          @freq_total = {}
        end

        def add_region_totals data, demographic_id, format_id
          @contacts_total[pos] += data.contacts.to_i
          @reach_total[pos] += data.reach.to_i
          @freq_total[pos] += data.frequency.to_i
        end

        def thousands value
          number_with_delimiter (value / 1000).round.to_i
        end

        def precision_2 value
          number_with_precision(value, :precision => 2)
        end

        def percents value
          number_to_percentage value * 100, :precision => 1
        end

        def tabs_js group
        %Q{
          <script type="text/javascript">
            $(function() {
              $('div.#{group}').not('.' + $('ul.#{group} a:first').attr('class')).hide();
              $('ul.#{group} a:first').addClass('active');

              $('ul.#{group}.tabs a').click(function() {
                $('div.#{group}').hide();
                $('ul.#{group}.tabs a').removeClass('active');
                $('div.#{group}.' + $(this).attr('class')).show();
                $('ul.#{group}.tabs a.' + $(this).attr('class')).addClass('active');
              });
            });
          </script>
        }
      end
    end
  end
end
