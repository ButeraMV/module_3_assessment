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

    expect(response.status).to eq(200)
    expect(json.length).to eq(2)
    expect(json.first['id']).to eq(item1.id)
    expect(json.first['name']).to eq(item1.name)
    expect(json.first['description']).to eq(item1.description)
    expect(json.first['image_url']).to eq(item1.image_url)
    expect(json.first['created_at']).not_to be_present
    expect(json.first['updated_at']).not_to be_present
  end

  it 'sends a requested item' do
    item1 = Item.create(name: 'item1',
                      description: 'this is an item',
                      image_url: 'google.com')
    item2 = Item.create(name: 'item2',
                      description: 'this is an item',
                      image_url: 'google.com')

    get '/api/v1/items/1'

    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json['id']).to eq(item1.id)
  end

  it 'can delete an item' do
    item1 = Item.create(name: 'item1',
                      description: 'this is an item',
                      image_url: 'google.com')

    expect(Item.count).to eq(1)

    delete '/api/v1/items/1'

    # json = JSON.parse(response.body)

    expect(response.status).to eq(204)
    expect(Item.count).to eq(0)
  end
end