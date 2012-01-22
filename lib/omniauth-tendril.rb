require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Tendril < OmniAuth::Strategies::OAuth2
      option :name, 'tendril'
      option :client_options, {
        :site => 'http://dev.tendrilinc.com',
        :request_token_path => '/oauth/request_token',
        :authorize_path => '/oauth/authorize',
        :access_token_path => '/oauth/access_token',
        :http_method => :get
      }
      #option :request_params, {
        #'X_ROUTE' => 'sandbox'
      #}
      option :authorize_params, {
        #:connectURL => 'http://cleangpa.com',
#client_id	 The application key of the application using Tendril Connect.	 6f521ecda32b66egb85031a9c9c1d38d
#client_secret	 The application secret for the application using Tendril connect.	 41fb402b836f7f7bbde771g9d28bad54
        #:callbackURL => 'http://cleangpa.com',
        :extendedPermissions => 'account consumption',
        :scope => 'greenbutton'
      }
    end
  end
end
