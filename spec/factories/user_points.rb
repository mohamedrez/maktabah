FactoryBot.define do
  factory :user_point do
    user { nil }
    scorable { nil }
    check? { false }
    point { 1 }
  end
end
