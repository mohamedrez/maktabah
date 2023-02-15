require "rails_helper"

RSpec.feature "User management", :type => :feature do
  scenario "login" do
    visit "/users/sign_in"
    user = create(:user)
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => 'wrongpassword'
    click_button "Log in"

    expect(page).to have_text("Invalid Email or password.")
  end
end
