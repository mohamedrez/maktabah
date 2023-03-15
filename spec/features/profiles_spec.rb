# require 'rails_helper'

# RSpec.describe 'visiting the edit profile page', type: :feature do
#   it "changes the user's attributes" do

#     visit new_user_session_url
#     user = User.create! email: "email@eila.com", password: "somepassword", confirmation_token: "2023-03-15 13:24:03.915976000 +0000", confirmed_at: "2023-03-15 13:28:03.915976000 +0000"
#     fill_in "user_email", with: user.email
#     fill_in "user_password", with: user.password
#     click_button "Log in"

#     visit users_profile_edit_url
#     fill_in "user_username", with: "hi42"
#     fill_in "user_learning_goal", with: "I wanna become a full stack RoR"

#     click_button 'Save'

#     user.reload
#     expect(user.username).to eq('hi42')
#     expect(user.learning_goal).to eq('I wanna become a full stack RoR')
#   end
# end
