require 'rails_helper'

# Acceptance Criteria
# [√] User can naviagte to a page to add a highlight post
# [] User can user their location to add latitude, longitude to post
# [] User will see highlight post on their trip page
# [] User will see map marker on their trips dashboard

feature "As a logged in user,
I want to add highlights to my trip,
so that I have them organized by trip and in total" do
  scenario "user adds highlight post successfully" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)
    highlight = FactoryGirl.create(:highlight, trip: trip)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit trip_path(trip)

    click_link "new-highlight"
    expect(page).to have_content("Add Highlights to your trip")

    fill_in "Address", with: highlight.address
    fill_in "Latitude", with: highlight.latitude
    fill_in "Longitude", with: highlight.longitude
    fill_in "Location name", with: highlight.location_name
    fill_in "Memory", with: highlight.memory

    click_button "Create Highlight"

    expect(page).to have_content("Highlight added to your trip!")
    expect(page).to have_content(highlight.location_name)
  end
  scenario "user doesn't add post successfully" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit trip_path(trip)

    click_link "new-highlight"
    expect(page).to have_content("Add Highlights to your trip")
    click_button "Create Highlight"

    expect(page).to have_content("can't be blank")
  end
end
