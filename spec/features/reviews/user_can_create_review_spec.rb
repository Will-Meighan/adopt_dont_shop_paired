require 'rails_helper'

describe "As a visitor" do

  before :each do
    @shelter_1 = Shelter.create(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")
  end

  describe "when I visit the a shelter show page" do
    it "I can click the link to fill out a form to add a new review" do

      title = "Good"
      rating = 5
      content = "I found my new best friend"
      image = "https://images-ra.adoptapet.com/images/Homepage-DogV2.png"

      visit "/shelters/#{@shelter_1.id}"

      expect(page).to_not have_content(title)
      expect(page).to_not have_content(rating)
      expect(page).to_not have_content(content)
      expect(page).to_not have_content(image)

      click_link 'Add Review'

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/new")

      expect(page).to have_content("Add a Review")

      fill_in 'Title', with: title
      select rating, from: :rating
      fill_in 'Content', with: content
      fill_in 'Image', with: image

      click_button 'Submit'

      expect(current_path).to eq("/shelters/#{@shelter_1.id}")

      expect(page).to have_content(title)
      expect(page).to have_content(rating)
      expect(page).to have_content(content)
      expect(page).to have_css("img[src*='#{image}']")
    end
  end
end
