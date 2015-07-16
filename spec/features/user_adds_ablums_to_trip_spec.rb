require 'rails_helper'

# Acceptance Criteria
# [] User can naviagte to a page to add an album
# [] User can upload multiple photos
# [] User will see photos on trip page

feature "As a logged in user,
I want to add photos to my trip,
so that I have them organized by trip" do
  scenario "user adds successfully" do
    user = FactoryGirl.create(:user)
    trip = FactoryGirl.create(:trip, user: user)
    ablum = FactoryGirl.create(:album, trip: trip)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit trip_path(trip)

    click_link "new-album"
    expect(page).to have_content("Add Photos")

    attach_file "Photos",
      "#{Rails.root}/spec/support/images/test1.jpg"
    attach_file "Photo",
      "#{Rails.root}/spec/support/images/test2.jpg"
    attach_file "Photo",
      "#{Rails.root}/spec/support/images/test3.jpg"

    click_button "Upload Photos"

    expect(page).to have_content("Photos added to your trip!")
    expect(page).to have_css("img[src*='test1.png']")
  end
end
