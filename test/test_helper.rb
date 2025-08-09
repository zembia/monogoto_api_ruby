# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "monogoto_api"

require "dotenv/load"
require "minitest/autorun"
require "vcr"

VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
    config.filter_sensitive_data("<MONOGOTO_USER>") do
        ENV.fetch("MONOGOTO_USER", nil)
    end
    config.filter_sensitive_data("<MONOGOTO_PASS>") do
        ENV.fetch("MONOGOTO_PASS", nil)
    end
    config.filter_sensitive_data("<MONOGOTO_ICCID_SAMPLE>") do
        ENV.fetch("MONOGOTO_ICCID_SAMPLE", nil)
    end
end
