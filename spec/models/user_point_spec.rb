require "rails_helper"

RSpec.describe UserPoint, type: :model do
  before do
    @user1 = FactoryBot.create(:user)

    @track = FactoryBot.create(:track)

    @course = FactoryBot.create(:course, track: @track)

    @lecture = FactoryBot.create(:lecture)
    @quiz = FactoryBot.create(:quiz)

    @step1 = FactoryBot.create(:step, course: @course, stepable: @lecture, position: 0)
    @step2 = FactoryBot.create(:step, course: @course, stepable: @quiz, position: 1)
  end

  describe ".score_me" do
    it "returns 10 when a lecture is completed" do
      UserPoint.score_me(@user1, @step1)
      user_point = UserPoint.find_by!(user: @user1, scorable: @step1)
      expect(user_point.point).to eql(10)
    end

    it "returns 20 when a quiz is completed" do
      UserPoint.score_me(@user1, @step2)
      user_point = UserPoint.find_by!(user: @user1, scorable: @step2)
      expect(user_point.point).to eql(20)
    end

    it "returns 150 when a course is completed" do
      UserPoint.score_me(@user1, @course)
      user_point = UserPoint.find_by!(user: @user1, scorable: @course)
      expect(user_point.point).to eql(150)
    end
  end
end
