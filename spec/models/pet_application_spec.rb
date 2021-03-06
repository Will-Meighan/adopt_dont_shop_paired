require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe 'relationships' do
    it {should belong_to :pet}
    it {should belong_to :application}
  end

  it '#get_pets' do
    mikes_shelter = Shelter.create(name: "Mike's Shelter",
      address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")

    megs_shelter = Shelter.create(name: "Meg's Shelter", address: "150 Main Street",
    city: "Hershey", state: "CO", zip: "17033")

    athena = Pet.create(image: "https://images-ra.adoptapet.com/images/Homepage-DogV2.png",
    name: "Athena",
    description: "butthead",
    approximate_age: 1,
    sex: "female",
    adoption_status: "adoptable",
    shelter_name: "Mike's Shelter",
    shelter_id: mikes_shelter.id)

    odell = Pet.create(image: "https://imgix.bustle.com/uploads/getty/2019/11/18/6296727a-d38c-40b4-8ffe-dbec5cd1b289-getty-954967324.jpg?w=1020&h=576&fit=crop&crop=faces&auto=format&q=70",
    name: "Odell",
    description: "good dog",
    approximate_age: 4,
    sex: "male",
    adoption_status: "adoptable",
    shelter_name: "Meg's Shelter",
    shelter_id: megs_shelter.id)
    app1 = Application.create(name: "Hello", address: "123 E. Tray", city: "Denver", state: "CO", zip: "80034", phone_number: "7204678498", description: "i like pets")
    petapp1 = PetApplication.create(application_id: app1.id, pet_id: odell.id)

    expect(petapp1.get_pets).to eq([odell])
  end
end
