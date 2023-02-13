# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  track_id   :bigint           not null
#  name       :string(255)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :course do
    name { "MyString" }
    position { 1 }
    description { nil }
    track { nil }
  end
end
