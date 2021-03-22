require 'json'
require 'net/https'
require "uri"

module YahooShoppingWebService
  class Category
    class << self

      def ranking(category_id)
        uri = URI("https://shopping.yahooapis.jp/ShoppingWebService/V1/categoryRanking?appid=#{appid}&category_id=#{category_id}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        req = Net::HTTP::Get.new(uri)
        res = http.request(req)
        body = Hash.from_xml(res.body)
        body = JSON.parse(body.to_json, object_class: OpenStruct)
        body.ResultSet.Result.RankingData
      end

      def search(category_id)
        uri = URI("https://shopping.yahooapis.jp/ShoppingWebService/V1/categorySearch?appid=#{appid}&category_id=#{category_id}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        req = Net::HTTP::Get.new(uri)
        res = http.request(req)
        body = Hash.from_xml(res.body)
        body = JSON.parse(body.to_json, object_class: OpenStruct)
        body&.ResultSet&.Result&.Categories
      end

      private

      def appid
        'dj00aiZpPWN3RktHWUNYQ3J2TSZzPWNvbnN1bWVyc2VjcmV0Jng9NWE-'
      end
    end
  end
end