require 'json'
require 'net/https'
require "uri"

module YahooShoppingWebService
  class Item
    class << self

      def search(**params)
        query = URI.encode_www_form(params)
        uri = URI("https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch?appid=#{appid}&" + query)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        req = Net::HTTP::Get.new(uri)
        res = http.request(req)
        body = res.body
        body = JSON.parse(body, object_class: OpenStruct)
        body.hits
      end

      def appid
        'dj00aiZpPWN3RktHWUNYQ3J2TSZzPWNvbnN1bWVyc2VjcmV0Jng9NWE-'
      end
    end
  end
end