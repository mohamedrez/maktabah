# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id            :bigint           not null, primary key
#  course_id     :bigint           not null
#  position      :integer
#  stepable_type :string(255)      not null
#  stepable_id   :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string(255)
#
require "rails_helper"

RSpec.describe(Step, type: :model) do
  before do
    @track = FactoryBot.create(:track)
    @course = FactoryBot.create(:course, track: @track)
    @lecture1 = FactoryBot.create(:lecture)
    @lecture2 = FactoryBot.create(:lecture)
    @step1 = FactoryBot.create(:step, course: @course, stepable: @lecture1, position: 0)
    @step2 = FactoryBot.create(:step, course: @course, stepable: @lecture2, position: 1)
  end

  describe "#next_step" do
    it "return the next step because it exists" do
      expect(@step1.next_step).to eql(@step2)
    end

    it "return null because this step is the last one" do
      expect(@step2.next_step).to eql(nil)
    end
  end
end
