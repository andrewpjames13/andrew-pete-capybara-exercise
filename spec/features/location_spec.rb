require 'rails_helper'


describe 'User can CRUD locations' do

  scenario 'User can create a Location' do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Galvanize"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"


    #now we expect the index page to have the name of the location we created.
    expect(page).to have_content("Galvanize")
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")
  end

  scenario 'User can view a show page for a location' do

    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "g6"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"
    expect(page).to have_content("Location was successfully created")


    click_on "g6"
    expect(page).to have_content("90210")


  end

  scenario 'User can edit a location' do

    @location = Location.create(:name => "g6", :address => '1234', :zipcode => 9010)

    visit "/locations/#{@location.id}/edit"

    fill_in 'location[name]', :with => "California"
    fill_in 'location[address]', with: "westcoast"
    fill_in 'location[zipcode]', with: "90410"

    click_on "Update Location"

    expect(page).to have_content("California")
  end


  scenario 'User can delete a location' do
    @location = Location.create(:name => "Hello", :address => '4444', :zipcode => 9808)

    visit "/"

    click_on "Delete"

    expect(page).to have_content("Location was successfully destroyed.")
  end






end
