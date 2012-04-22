
FactoryGirl.define do
  factory :snapshot, :class => Refinery::Snapshots::Snapshot do
    sequence(:reaches_1) { |n| "refinery#{n}" }
  end
end

