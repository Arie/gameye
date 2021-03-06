require "simplecov"
require "coveralls"

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter])
SimpleCov.start

require "pry-nav"
require "vcr"
require "gameye"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr"
  c.hook_into :faraday
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.before(:suite) do
    Gameye.token = "api-token"
  end
end
