require 'rails_helper'

RSpec.describe "UserProgresses", type: :request do
  describe "POST /create" do
    context "when user is  logged in" do
      before do
        @user = FactoryBot.create(:user)
        @track = FactoryBot.create(:track)
        @course = FactoryBot.create(:course, track: @track)
        @lecture = FactoryBot.create(:lecture)
        @step = FactoryBot.create(:step, course: @course, stepable: @lecture)
        sign_in @user
      end

      xit "creates user progress with started and completes it " do
        post user_progresses_path, params: { step_id: @step.id, status: :started }
        expect(UserProgress.first.status).to eq("started")
        post user_progresses_path, params: { step_id: @step.id, status: :completed }
        expect(UserProgress.first.status).to eq("completed")
      end
    end
  end
end
