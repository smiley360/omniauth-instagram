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
        hash = { token: long_token['access_token'], expires_at: long_token['expires_in'], expires: true }
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

      def raw_info
        endpoint = '/me'
        fields = 'account_type,id,media_count,username'
        @raw_info ||= access_token.get("#{endpoint}?fields=#{fields}").parsed
      end

      def long_token
        @long_token ||= access_token.get('/access_token', exchange_options).parsed || {}
      end

      def exchange_options
        params = { grant_type: 'ig_exchange_token' }
        params.merge!(client_secret: options.client_secret)
        params.merge!(access_token: access_token.token)

        { params: params }
      end
    end
  end
end
