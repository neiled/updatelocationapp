module FireEagle
  class Error < StandardError; end
 
  def self.config(environment=RAILS_ENV)
    @config ||= {}
    @config[environment] ||= YAML.load(File.open(RAILS_ROOT + '/config/fireeagle_auth.yml').read)[environment]
  end
 
  def self.base_url
    config['base_url'] || 'https://twitter.com'
  end
 
  def self.path_prefix
    URI.parse(base_url).path
  end
 
  def self.api_timeout
    config['api_timeout'] || 10
  end
 
  def self.encryption_key
    raise TwitterAuth::Cryptify::Error, 'You must specify an encryption_key in config/fireeagle_auth.yml' if config['encryption_key'].blank?
    config['encryption_key']
  end
 
  def self.oauth_callback?
    config.key?('oauth_callback')
  end
 
  def self.oauth_callback
    config['oauth_callback']
  end
 
  def self.remember_for
    (config['remember_for'] || 14).to_i
  end
 

  # The OAuth consumer used by TwitterAuth for authentication. The consumer key and secret are set in your application's +config/twitter.yml+
  def self.consumer
    options = {:site => FireEagle.base_url}
    [ :authorize_path,
      :request_token_path,
      :access_token_path,
      :scheme ].each do |oauth_option|
      options[oauth_option] = FireEagle.config[oauth_option.to_s] if FireEagle.config[oauth_option.to_s]
    end
 
    OAuth::Consumer.new(
      config['oauth_consumer_key'],
      config['oauth_consumer_secret'],
      options
    )
  end
 
  def self.net
    uri = URI.parse(FireEagle.base_url)
    net = Net::HTTP.new(uri.host, uri.port)
    net.use_ssl = uri.scheme == 'https'
    net.read_timeout = FireEagle.api_timeout
    net
  end
 
  def self.authorize_path
    config['authorize_path'] || '/oauth/authorize'
  end
end
 
# require 'twitter_auth/controller_extensions'
# require 'twitter_auth/cryptify'
# require 'twitter_auth/dispatcher/oauth'
# require 'twitter_auth/dispatcher/basic'
# require 'twitter_auth/dispatcher/shared'
 
module FireEagle
  module Dispatcher
    class Error < StandardError; end
    class Unauthorized < Error; end
  end
end