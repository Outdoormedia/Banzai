
FactoryGirl.define do
  factory :carousel, :class => Refinery::Carousels::Carousel do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

