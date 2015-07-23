require 'rails_helper'

# Acceptence Criteria
# [√] User can navigate to an update page for a highlight
# [√] The highlight is populated with current information
# [√] User can change previous content
# [√] The new information persists to the database

feature "As an authenticated user
I want to update my highlight details
So that I can keep my trip up to date" do
  scenario "authenticated user clinks link to update highlight" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)
    highlight = FactoryGirl.create(:highlight, trip: trip)
    location_name_update = 'To the top of the Monument'

    visit '/'
    click_link("Sign In")
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button('Log in')

    visit trip_highlight_path(trip, highlight)
    click_link("edit-highlight")
    fill_in 'Location name', with: location_name_update
    click_button 'Update'

    expect(page).to have_content("Your post has been updated successfully.")
    expect(page).to have_content(location_name_update)
  end
end
