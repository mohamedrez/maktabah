# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    ask { "MyText" }
    quiz { nil }
  end
end
