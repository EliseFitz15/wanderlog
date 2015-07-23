require "rails_helper"

# Acceptance Criteria
# [] There is a delete button on the trip show page
# [] I can click the button to delete
# [] I am prompted when I try to delete a highlight, to verify decision

feature "As an logged in user
I want to delete a highlight and it's contents
so that it's no longer on my trip dashboard" do
  scenario 'User deletes a highlight' do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)
    highlight = FactoryGirl.create(:highlight, trip: trip)

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit trip_highlight_path(trip, highlight)

    click_link("delete-highlight")

    expect(page).to have_content("Highlight Deleted")
    expect(page).to_not have_content(highlight.location_name)
  end
end
