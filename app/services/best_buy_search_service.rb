class BestBuySearchService
  def self.get_stores_by_zip(zip_code)
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['API_KEY']}"
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end
end