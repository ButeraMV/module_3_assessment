class Store
  attr_reader :name, :city, :distance, :phone_number, :store_type

  def initialize(attrs={})
    @name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone_number = attrs[:phone]
    @store_type = attrs[:storeType]
  end

  def self.get_store_results(zip_code)
    store_data = BestBuySearchService.get_stores_by_zip(zip_code)
    store_data[:stores].map do |store_data|
      Store.new(store_data)
    end
  end

  def self.get_count(zip_code)
    store_data = BestBuySearchService.get_stores_by_zip(zip_code)
    store_count = store_data[:total]
  end


end