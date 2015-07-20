require "rails_helper"

# Acceptance Criteria
# [√] User logs in and sees dashboard of their trips
# [√] Dashboard will show future and past trips ordered by time

feature "As a logged in user,
I want to see a dashboard of my trips
so I can view future and past trips" do
  scenario "user sees trips they created organized by past and future trips" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit "/"

    click_link "Dashboard"

    expect(page).to have_content("Charlotte's Trips")

    expect(page).to have_content(trip.title)
    expect(page).to have_content(trip.description)
    expect(page).to have_content(trip.startdate.strftime("%b %d, %Y"))
    expect(page).to have_content(trip.user.name)
  end
end
