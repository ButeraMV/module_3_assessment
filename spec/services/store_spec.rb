require 'rails_helper'

describe Store do
  it 'can be created with valid attributes' do
    valid_attrs = {longName: 'Name',
                  city: 'City',
                  distance: '1.2',
                  phone: '1234567890',
                  storeType: 'Big Box'}

    store = Store.new(valid_attrs)

    expect(store.name).to eq('Name')
    expect(store.city).to eq('City')
    expect(store.distance).to eq('1.2')
    expect(store.phone_number).to eq('1234567890')
    expect(store.store_type).to eq('Big Box')
  end
end