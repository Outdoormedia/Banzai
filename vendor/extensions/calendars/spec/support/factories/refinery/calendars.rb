
FactoryGirl.define do
  factory :calendar, :class => Refinery::Calendars::Calendar do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

