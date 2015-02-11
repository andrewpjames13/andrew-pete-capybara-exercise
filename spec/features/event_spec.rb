require 'rails_helper'

describe 'User can CRUD events' do

  scenario 'User can create an event' do

    visit '/'

    click_on "New Location"

    fill_in 'location[name]', :with => "g6"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    click_on "Create Location"
    expect(page).to have_content("Location was successfully created")

    click_on 'Add Event'
    expect(page).to have_content("New Event")

    fill_in 'event[description]', with: "shindig"
    fill_in 'event[date]', with: "07/11/1989"
    check 'event[requires_id]'

    click_on 'Create Event'
    expect(page).to have_content("Event was successfully created")

  end

  scenario 'User can visit event show page' do
    visit '/'

    click_on "New Location"

    fill_in 'location[name]', :with => "g6"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    click_on "Create Location"
    expect(page).to have_content("Location was successfully created")

    click_on 'Add Event'
    expect(page).to have_content("New Event")

    fill_in 'event[description]', with: "shindig"
    fill_in 'event[date]', with: "07/11/1989"
    check 'event[requires_id]'

    click_on 'Create Event'
    expect(page).to have_content("Event was successfully created")

    click_on 'shindig'
    expect(page).to have_content("shindig")
  end

end
