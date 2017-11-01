class Search
  def initialize(attrs={})
    @name = attrs['name']
    @city = attrs['city']
    @distance = attrs['distance']
    @phone_number = attrs['phone_number']
    @store_type = attrs['store_type']
  end

  def self.get_store_results(zip_code)
    raw_stores = BestBuySearchService.get_stores_by_zip(zip_code)
    raw_stores.map do |store_data|
      Search.new(store_data)
    end
  end
end