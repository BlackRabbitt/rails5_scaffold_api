FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "kdkfa#{n}" }
  end
end
