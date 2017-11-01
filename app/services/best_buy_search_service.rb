class BestBuySearchService
  def initialize
    @conn = Faraday.new('https://api.bestbuy.com/v1') do |faraday|
      faraday.headers['Authorization'] = "token #{@user.token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.get_stores_by_zip(zip_code)
    @conn.get "/stores(area(#{zip_code},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['API_KEY']}"
  end
end