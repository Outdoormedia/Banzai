
FactoryGirl.define do
  factory :plan_by_format, :class => Refinery::PlanByFormats::PlanByFormat do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

