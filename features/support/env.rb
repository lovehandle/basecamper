require 'rubygems'
require 'bundler/setup'
require 'active_resource'
require 'basecamper'

module BasecamperMethods
  def basecamp_user
    basecamp['user']
  end

  def basecamp_password
    basecamp['password']
  end

  def basecamp_token
    basecamp['token']
  end

  def basecamp_domain
    basecamp['domain']
  end

  def basecamp
    @basecamp ||= YAML::load_file(File.dirname(__FILE__) + "../../spec/fixtures/basecamp.yml")
  end
end


World(BasecamperMethods)

Before do
  Basecamper::Connection.configure do |config|
    config.user     = basecamp_user
    config.password = basecamp_password
    config.token    = basecamp_token
    config.domain   = basecamp_domain
  end
end
