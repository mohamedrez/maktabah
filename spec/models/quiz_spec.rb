# frozen_string_literal: true

# == Schema Information
#
# Table name: quizzes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe(Quiz, type: :model) do
  before do
    @quiz = FactoryBot.create(:quiz, surveyjs: "{     \"question1\": \"Item 3\",     \"question2\": \"Item 2\",     \"question3\": \"Item 4\" }")
  end

  describe "#get_my_asset" do
    it "returns the surveyjs column from quizzes table" do
      expect(@quiz.get_my_asset).to eql("{\"question1\":\"Item 3\",\"question2\":\"Item 2\",\"question3\":\"Item 4\"}")
    end
  end
end
