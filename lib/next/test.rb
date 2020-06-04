require "ruby-next/core_ext"
require "anyway_config"
require "next/test/version"

module Next
  module Test
    class Error < StandardError; end

    class TestConfig < Anyway::Config
      config_name :test
      attr_config :username
    end
  end
end

puts "Config Value: #{Next::Test::TestConfig.new.username}"
