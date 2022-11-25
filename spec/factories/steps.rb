FactoryBot.define do
  factory :step do
    title { "MyString" }
    position { 1 }
    course { nil }
    stepable { nil }
  end
end
