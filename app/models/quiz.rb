# frozen_string_literal: true

# == Schema Information
#
# Table name: quizzes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Quiz < ApplicationRecord
  has_one :step, as: :stepable, dependent: :destroy
  has_many :user_quiz_responses, dependent: :destroy

  def get_my_asset
    JSON.parse(surveyjs).to_json
  end
end
