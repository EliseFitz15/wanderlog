require "rails_helper"

# Acceptance Criteria
# [√] User navigates to form to create new trip journal post
# [√] User creates journal post and it's added to their trip dashboard

feature "As a logged in user
I want to create a new journal post for a trip
so that I can journal about my trip" do
  scenario "user creates post for trip successfully" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)
    post = FactoryGirl.create(:post, trip: trip)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit trip_path(trip)

    click_link "new-post"
    expect(page).to have_content("New Post")

    fill_in "Headline", with: post.headline
    fill_in "Content", with: post.content

    click_button "Create Post"

    expect(page).to have_content("Post added to your trip!")
    expect(page).to have_content(post.headline)
  end
  scenario "user tries to create post unsuccessfully" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit trip_path(trip)

    click_link "new-post"
    expect(page).to have_content("New Post")

    click_button "Create Post"

    expect(page).to have_content("can't be blank")
  end
end
