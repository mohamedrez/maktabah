# frozen_string_literal: true

# == Schema Information
#
# Table name: user_progress_histories
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  step_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user_progress_history do
    user { nil }
    step { nil }
  end
end
