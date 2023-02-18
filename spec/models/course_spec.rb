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
require "rails_helper"

RSpec.describe(Course, type: :model) do
  before do
    @track = FactoryBot.create(:track)
    @course = FactoryBot.create(:course, track: @track)
    @lecture1 = FactoryBot.create(:lecture)
    @lecture2 = FactoryBot.create(:lecture)
    @lecture3 = FactoryBot.create(:lecture)
    @step1 = FactoryBot.create(:step, course: @course, stepable: @lecture1)
    @step2 = FactoryBot.create(:step, course: @course, stepable: @lecture2)
    @step3 = FactoryBot.create(:step, course: @course, stepable: @lecture3)
  end

  describe "#steps_count" do
    it "returns the count of the steps" do
      expect(@course.steps_count).to eql(3)
    end
  end
end
