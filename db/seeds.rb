# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

system 'rake db:fixtures:load'

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Plan By Formats extension
Refinery::PlanByFormats::Engine.load_seed

# Added by Refinery CMS Snapshots extension
Refinery::Snapshots::Engine.load_seed



# Added by Refinery CMS Carousels extension
Refinery::Carousels::Engine.load_seed

# Added by Refinery CMS Calendars extension
Refinery::Calendars::Engine.load_seed

# Planning Weights
Refinery::PlanByFormats::PlanningWeight.import_csv
