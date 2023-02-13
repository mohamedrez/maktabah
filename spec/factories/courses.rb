# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { "MyString" }
    position { 1 }
    description { nil }
    track { nil }
  end
end
