# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
require 'rails_helper'

describe "Items API" do
  it 'sends all items' do
    item1 = Item.create(name: 'item1',
                      description: 'this is an item',
                      image_url: 'google.com')
    item2 = Item.create(name: 'item2',
                      description: 'this is an item',
                      image_url: 'google.com')

    get '/api/v1/items'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.length).to eq(2)
    expect(json.first['id']).to be_present
    expect(json.first['name']).to be_present
    expect(json.first['description']).to be_present
    expect(json.first['image_url']).to be_present
    expect(json.first['created_at']).not_to be_present
    expect(json.first['updated_at']).not_to be_present
  end
end