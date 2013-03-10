# THIS DOES NOT WORK
# Was built as a stand way to import data but failed

namespace 'db' do
  require 'csv'

  desc 'import from CSV'
  task :pbf_import => :environment do
    puts 'Starting'

    puts 'Deleting Audience'
    Refinery::PlanByFormats::Audience.delete_all

    puts 'Starting building sql statement'

    counter = 0
    first = true

    inserts = []

    CSV::foreach('/Users/nigelr/Downloads/comparison/bombora.all.markets.ready.for.upload.sep12.csv') do |line|


      line[3] = "'#{line[3]}'"
      inserts.push "(#{line.join(',')})" unless first
      first = false
      counter += 1
      if counter == 1000
        sql = "INSERT INTO Audiences (demog_id, region_code, format_id, weight, duration, reach, contacts, region_pop) VALUES #{inserts.join(", ")}"
        puts 'Executing sql statement - Inserting 1000 items'
        Refinery::PlanByFormats::Audience.connection.execute sql
        counter = 0
        inserts = []
      end
    end
    sql = "INSERT INTO Audiences (demog_id, region_code, format_id, weight, duration, reach, contacts, region_pop) VALUES #{inserts.join(", ")}"
    puts 'Executing sql statement - Inserting remaining items'
    Refinery::PlanByFormats::Audience.connection.execute sql

    puts 'Translating IDs'

    #Refinery::PlanByFormats::Audience.translate_ids

    puts 'Finished'
  end
end


