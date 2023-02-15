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
require "rails_helper"

RSpec.describe(UserProgressHistory, type: :model) do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)

    @track = FactoryBot.create(:track)

    @course = FactoryBot.create(:course, track: @track)

    @lecture1 = FactoryBot.create(:lecture)
    @lecture2 = FactoryBot.create(:lecture)

    @quiz = FactoryBot.create(:quiz)

    @step1 = FactoryBot.create(:step, course: @course, stepable: @lecture1)
    @step2 = FactoryBot.create(:step, course: @course, stepable: @quiz)
    @step3 = FactoryBot.create(:step, course: @course, stepable: @lecture2)
  end

  it "get the last step for specific user" do
    UserProgressHistory.create!(user: @user1, step: @step1)
    UserProgressHistory.create!(user: @user1, step: @step2)
    UserProgressHistory.create!(user: @user2, step: @step1)
    UserProgressHistory.create!(user: @user2, step: @step2)
    UserProgressHistory.create!(user: @user1, step: @step3)

    expect(
      UserProgressHistory.get_last_step(@user2)
    ).to(eq(@step2))
  end

  it "get the last course for specific user" do
    UserProgressHistory.create!(user: @user1, step: @step1)
    UserProgressHistory.create!(user: @user1, step: @step2)
    UserProgressHistory.create!(user: @user2, step: @step1)
    UserProgressHistory.create!(user: @user2, step: @step2)
    UserProgressHistory.create!(user: @user1, step: @step3)

    expect(
      UserProgressHistory.get_last_course(@user1)
    ).to(eq(@course))
  end
end
