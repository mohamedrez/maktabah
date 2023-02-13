# frozen_string_literal: true

# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :track do
    name { "MyString" }
    position { 1 }
  end
end
