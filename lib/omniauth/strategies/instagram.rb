require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Instagram < OmniAuth::Strategies::OAuth2
      option :client_options,
             site: 'https://graph.instagram.com',
             authorize_url: 'https://api.instagram.com/oauth/authorize',
             token_url: 'https://api.instagram.com/oauth/access_token'

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

      def raw_info
        endpoint = '/me'
        fields = 'account_type,id,media_count,username'
        @data ||= access_token.get("#{endpoint}?fields=#{fields}").parsed

        # Change short-lived token for long-lived token
        exchange_endpoint = '/access_token'
        @token ||= access_token.get("#{exchange_endpoint}?grant_type=ig_exchange_token&client_secret=#{options[:client_secret]}").parsed
        @data.token = @token.access_token
        @data.expires = true
        @data.expires_at = @token.expires_in

        @data
      end
    end
  end
end
