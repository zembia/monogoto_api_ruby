# frozen_string_literal: true

require "test_helper"
require "debug"

class TestMonogotoApi < Minitest::Test
    def test_that_it_has_a_version_number
        refute_nil ::MonogotoApi::VERSION
    end

    def setup
        return if name == "test_that_it_has_a_version_number"

        VCR.use_cassette("login") do
            @client = MonogotoApi::Client.new(
                ENV.fetch("MONOGOTO_USER", nil),
                ENV.fetch("MONOGOTO_PASS", nil)
            )
        end
    end

    def test_get_thing_list
        VCR.use_cassette("thing_list") do
            things = @client.things

            assert_kind_of Array, things
            refute_empty things
        end
    end

    def test_get_thing
        VCR.use_cassette("thing") do
            thing = @client.thing(ENV.fetch("MONOGOTO_ICCID_SAMPLE", nil))

            assert_kind_of MonogotoApi::Thing, thing
        end
    end

    def test_get_thing_state
        VCR.use_cassette("thing_state") do
            state = @client.thing_state(ENV.fetch("MONOGOTO_ICCID_SAMPLE", nil))

            assert_kind_of String, state
        end
    end

    def test_thing_session_status
        VCR.use_cassette("thing_session_status") do
            session = @client.thing_session_status(ENV.fetch("MONOGOTO_ICCID_SAMPLE", nil))

            assert_kind_of MonogotoApi::SessionStatus, session
        end
    end

    def test_thing_events
        VCR.use_cassette("thing_events") do
            events = @client.thing_events(ENV.fetch("MONOGOTO_ICCID_SAMPLE", nil))

            assert_kind_of MonogotoApi::Event::List, events
        end
    end

    def test_thing_ping
        VCR.use_cassette("thing_ping") do
            ping = @client.thing_ping(ENV.fetch("MONOGOTO_ICCID_SAMPLE", nil))

            assert_kind_of MonogotoApi::Ping::List, ping
        end
    end
end
