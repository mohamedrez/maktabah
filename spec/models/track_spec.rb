# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Track, type: :model) do
  before do
    @track = FactoryBot.create(:track)

    @course1 = FactoryBot.create(:course, track: @track, position: 1)
    @course2 = FactoryBot.create(:course, track: @track, position: 2)

    @lecture1 = FactoryBot.create(:lecture)
    @lecture2 = FactoryBot.create(:lecture)

    @quiz1 = FactoryBot.create(:quiz)
    @quiz2 = FactoryBot.create(:quiz)

    @step1 = FactoryBot.create(:step, course: @course1, stepable: @lecture1, id: 1)
    @step2 = FactoryBot.create(:step, course: @course1, stepable: @lecture2, id: 2)
    @step3 = FactoryBot.create(:step, course: @course2, stepable: @quiz1, id: 3)
    @step4 = FactoryBot.create(:step, course: @course2, stepable: @quiz2, id: 4)
  end

  describe "#how_many_steps" do
    it "get all the steps include in a given track" do
      expect(@track.how_many_steps).to eql(4)
    end
  end
end
