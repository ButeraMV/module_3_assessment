require 'rails_helper'

describe "As a user" do
  it "I can search for nearby best buy stores within 25 miles" do
    visit '/'
    fill_in 'search', with: '80202'
    click_on 'Search'

    expect(current_path).to eq('/search')
    expect(page).to have_content('17 Total Stores')
    expect(page).to have_selector('.store', count: 10)
    expect(page).to have_selector('.name', count: 10)
    expect(page).to have_selector('.city', count: 10)
    expect(page).to have_selector('.distance', count: 10)
    expect(page).to have_selector('.phone_number', count: 10)
    expect(page).to have_selector('.store_type', count: 10)
  end
end