FactoryBot.define do
  factory :comment do
    created_at { "2019-11-16 21:33:00" }
    body { "MyText" }
    like_status { 1 }
  end
end
