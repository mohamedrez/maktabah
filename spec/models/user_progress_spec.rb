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
require "rails_helper"

RSpec.describe(UserProgress, type: :model) do
  context "user completes all steps in a course" do
    before do
      @user = FactoryBot.create(:user)
      @track = FactoryBot.create(:track)
      @course = FactoryBot.create(:course, track: @track)
      @lecture1 = FactoryBot.create(:lecture)
      @lecture2 = FactoryBot.create(:lecture)
      @step1 = FactoryBot.create(:step, course: @course, stepable: @lecture1)
      @step2 = FactoryBot.create(:step, course: @course, stepable: @lecture2)
    end

    it "creates completes a course progress when all the steps are completed " do
      user_progress1 = FactoryBot.create(
        :user_progress, user: @user, progressable: @step1, status: :started
      )
      user_progress1.update(status: :completed)
      user_progress2 = FactoryBot.create(
        :user_progress, user: @user, progressable: @step1, status: :started
      )
      user_progress2.update(status: :completed)
      expect(
        UserProgress.where(
          user_id: @user.id, progressable: @course,
        ).first&.status,
      ).to(eq("completed"))
    end

    it "status of course must be nil if all steps not compeleted" do
      FactoryBot.create(
        :user_progress, user: @user, progressable: @step1, status: :started
      ).update(status: :completed)

      FactoryBot.create(
        :user_progress, user: @user, progressable: @step1, status: :started
      )

      expect(
        UserProgress.where(
          user_id: @user.id, progressable: @course,
        ).first&.status,
      ).to(eq(nil))
    end
  end
end
