namespace :db do
  desc "Import from db/snapshot_import.yml"
  task :snapshot_import => :environment do
    Refinery::Snapshots::Snapshot.import
  end
end