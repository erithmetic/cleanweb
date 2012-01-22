require 'oauth'

class Tendril
  def self.meter_for(key, secret)
    session(key, secret).get '/connect/greenbutton', :from => '01/01/2011', :to => '01/01/2012'
  end

  def session(consumer_key, consumer_secret)
    faraday = Faraday.new(:url => 'http://dev.tendrilinc.com/') do |builder|
      builder.request :OAuth, {
        :consumer_key => consumer_key,
        :consumer_secret => consumer_secret
      }
      builder.request  :url_encoded
      builder.request  :json
      builder.response :logger if debug?
      builder.adapter  :net_http

      builder.use Faraday::Response::ParseXml
    end
    faraday
  end
end
