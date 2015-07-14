require "rails_helper"

# Acceptance Criteria
# [√] There is a delete button on the trip show page
# [√] I can click the button to delete
# [] I am prompted when I try to delete a trip, to verify decision

feature "As an logged in user
I want to delete a trip and it's contents
so that it's no longer on my dashboard" do
  scenario 'User deletes a trip' do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit trip_path(trip)

    click_link("delete-post")

    expect(page).to have_content("Trip Deleted")
    expect(page).to_not have_content(trip.title)
  end
end
