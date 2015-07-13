require "rails_helper"

# Acceptance Criteria
# [√] Homepage has a link public trips index
# [√] Homepage has a link to about page

feature "As an unauthenticated user,
I want to see login, sign up or about page link
so that I can learn about the app before subscribing" do
  scenario "unauthenticated user can see about page" do
    visit "/"

    click_link "About"

    expect(page).to have_content("About Wanderlog")

  end
  scenario "unauthenticated user can see public trips" do
    visit "/"

    click_link "Wander"

    expect(page).to have_content("I haven't gone everywhere")
  end
end
