# frozen_string_literal: true

# == Schema Information
#
# Table name: user_progresses
#
#  id                :bigint           not null, primary key
#  status            :integer
#  user_id           :bigint           not null
#  progressable_type :string(255)      not null
#  progressable_id   :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :user_progress do
    status { 1 }
    user { nil }
    progressable { nil }
  end
end
