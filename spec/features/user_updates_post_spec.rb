require 'rails_helper'

# Acceptence Criteria
# [] I can navigate to an update page for post
# [] The post is populated with current information
# [] I can change previous content
# [] The new information persists to the database

feature "As an authenticated user
I want to update my trips details
So that I can keep my trip up to date" do
  scenario "authenticated user clinks link to update trip" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)
    post = FactoryGirl.create(:post, trip: trip)
    headline_update = 'Walking Down Commercial St.'

    visit '/'
    click_link("Sign In")
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button('Log in')

    visit trip_post_path(post, trip)
    click_link("edit-post")
    fill_in 'Headline', with: headline_update
    click_button 'Update'

    expect(page).to have_content("Your post has been updated successfully.")
    expect(page).to have_content(headline_update)
  end
end
