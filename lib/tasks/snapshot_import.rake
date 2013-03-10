namespace :db do
  desc 'Import from db/snapshot_import.yml'
  task :snapshot_import => :environment do
    puts 'Starting'
    Refinery::Snapshots::Snapshot.import
    puts 'Finished'
  end
end