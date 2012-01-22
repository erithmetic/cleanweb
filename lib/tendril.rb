require 'oauth'

class Tendril
  def self.meter_for(key)
    session(key).get('/connect/greenbutton?from=01/01/2011&to=01/01/2012&resolution=MONTHLY').
      body
  end

  def self.session(token)
    faraday = Faraday.new(:url => 'http://dev.tendrilinc.com/') do |builder|
      builder.request :OAuth2, token
      builder.request  :url_encoded
      #builder.request  :json
      builder.response :logger
      builder.adapter  :net_http

      builder.use Faraday::Response::ParseJson
    end
    faraday
  end


  def self.get_data(student)
    data = Tendril.meter_for(student.tendril_key)
    puts data.inspect
    address = student.addresses.create :name => 'Meter', :square_footage => 2500
    data['intervalBlock']['intervalBlocks'].each do |interval_block|
      interval_block['intervalReadings'].each do |reading|
        #w = reading['value'].to_f
        #hours = reading['timePeriod']['duration'].to_f / 60 / 60
        #kwh = (w / 1000) * hours
        #Rails.logger.info "#{w}w for #{hours}hrs"
        address.readings.create :amount => reading['value'].to_f / 1000,
          :read_at => Time.at(reading['timePeriod']['start'].to_i)
      end
    end
  end
end
