require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Tendril < OmniAuth::Strategies::OAuth
      option :name, 'tendril'
      option :client_options, {
        :site => 'http://dev.tendrilinc.com',
        :authorize_path => 'oauth/authorize',
        :request_token_path => 'oauth/request_token',
        :access_token_path => 'oauth/access_token'
      }
    end
  end
end
