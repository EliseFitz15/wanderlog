require 'rails_helper'

# Acceptence Criteria
# [] I can navigate to an update page for trip
# [] The trip is populated with accurate information
# [] I can change previous information
# [] The new information persists to the database

feature "As an authenticated user
I want to update my trips details
So that I can keep my trip up to date" do
  scenario "authenticated user clinks link to update trip" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)
    title_update = 'Adventures in Provincetown'

    visit '/'
    click_link("Sign In")
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button('Log in')

    click_link("Dashboard")
    expect(page).to have_content("Charlotte's Trips")

    click_link trip.title
    click_button("Edit")

    fill_in 'Title', with: title_update
    click_button 'Update'
    expect(page).to have_content("Your trip has been updated successfully.")
    expect(page).to have_content(title_update)

    click_button("Edit")
    expect(find_field('Title').value).to eq title_update
  end
end
