FactoryBot.define do
  factory :step do
    course { nil }
    position { 1 }
    stepable { nil }
    name { "StepName" }
  end
end
