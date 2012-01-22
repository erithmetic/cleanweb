require 'vcr'
VCR.config do |c|
  c.cassette_library_dir = 'cassettes'
  c.default_cassette_options = { :record => :new_episodes }
  c.stub_with :fakeweb, :faraday
  c.around_http_request do |request|
    VCR.use_cassette('global', :record => :new_episodes, &request)
  end
end
