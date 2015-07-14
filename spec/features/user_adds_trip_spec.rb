require "rails_helper"

# Acceptance Criteria
# [√] User navigates to form to create new trip
# [√] User creates trip and it's added to their dashboard

feature "As a logged in user
I want to create a new log for a trip
so that I can log my travel adventures in one place" do
  scenario "user creates trip successfully" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit trips_path

    click_link "Add New Trip"
    expect(page).to have_content("Where will you wander?")

    fill_in "Title", with: trip.title
    fill_in "Description", with: trip.description
    fill_in "Startdate", with: trip.startdate

    click_button "Create Trip"

    expect(page).to have_content("Trip added to your dashboard!")
    expect(page).to have_content("Charlotte's Trips")
    expect(page).to have_content(trip.title)
  end
  scenario "user tries to create trip unsuccessfully" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit trips_path

    click_link "Add New Trip"
    expect(page).to have_content("Where will you wander?")

    click_button "Create Trip"

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Charlotte's Trips")
  end
end
