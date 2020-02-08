require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Instagram < OmniAuth::Strategies::OAuth2
      option :name, 'instagram'

      option :client_options,
             site: 'https://graph.instagram.com',
             authorize_url: 'https://api.instagram.com/oauth/authorize',
             token_url: 'https://api.instagram.com/oauth/access_token'

      credentials do
        hash = {token: exchange_token['access_token']}
        hash["expires_at"] = exchange_token['expires_in']
        hash["expires"] = true
        hash
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def request_phase
        options[:scope] ||= 'user_profile,user_media'
        options[:response_type] ||= 'code'
        super
      end

      uid { raw_info['id'] }

      info { raw_info }

      def exchange_token
        exchange_options = {
            grant_type: 'ig_exchange_token',
            client_secret: options.client_secret
        }
        @token ||= access_token.get('/access_token', exchange_options).parsed
      end

      def raw_info
        endpoint = '/me'
        fields = 'account_type,id,media_count,username'
        @data ||= access_token.get("#{endpoint}?fields=#{fields}").parsed
      end
    end
  end
end
