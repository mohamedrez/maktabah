# frozen_string_literal: true

FactoryBot.define do
  factory :user_progress do
    status { 1 }
    user { nil }
    progressable { nil }
  end
end
