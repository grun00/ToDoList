FactoryBot.define do
  factory :task do
    sequence :title do |n|
      "Task#{n}"
    end

    sequence :description do |n|
      "Description#{n}"
    end

    priority { 10 } 

    user
  end
end
