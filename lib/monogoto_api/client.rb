# frozen_string_literal: true

require "httparty"

module MonogotoApi
    class Client
        include HTTParty
        base_uri "https://console.monogoto.io"

        def initialize(user, password)
            auth = { "UserName" => user, "Password" => password }
            jwt_response = self.class.post(
                "/Auth",
                body: auth.to_json, headers: { "Content-Type" => "application/json" }
            )

            @jwt         = jwt_response["token"]
            @customer_id = jwt_response["CustomerId"]
        end


        def things
            resp = get("/things", headers: auth_header)
            MonogotoApi::Thing.parse_many(resp.parsed_response)
        end

        def thing(iccid)
            resp = get("/thing/ThingId_ICCID_#{ iccid }", headers: auth_header)
            MonogotoApi::Thing.parse(resp.parsed_response)
        end

        def thing_state(iccid)
            get("/thing/ThingId_ICCID_#{ iccid }/state", headers: auth_header)
        end

        def thing_session_status(iccid)
            resp = get("/thing/status/?ThingIds=ThingId_ICCID_#{ iccid }", headers: auth_header)
            MonogotoApi::SessionStatus.parse(resp.parsed_response)
        end

        def thing_events(iccid, limit: 20 )
            body = { "ThingIdELK" => "ThingId_ICCID_#{ iccid }", "limit" => limit }
            # body.merge!(opts) if opts.any?
            resp = post(
                "/thing/searchCDR",
                body: ,
                headers: apikey_headers
            )
            MonogotoApi::Event.parse_many(resp.parsed_response["hits"])
        end

        def thing_ping(iccid)
            thing_data = thing(iccid)
            resp = post(
                "/thing/ThingId_ICCID_#{ iccid }/ping",
                body: { "IPAddress" => thing_data.ip },
                headers: apikey_headers
            )
            MonogotoApi::Ping::List.parse(resp)
        end

        def thing_refresh_connection(iccid)
            resp = get("/thing/ThingId_ICCID_#{ iccid }/refreshConnection", headers: auth_header)
            resp.success?
        end

        private

        def auth_header
            { Authorization: "Bearer #{ @jwt }" }
        end

        def apikey_headers
            { Authorization: "Bearer #{ @jwt }", apikey: @customer_id }
        end

        def get(path, headers: {})
            self.class.get(path, headers:)
        end

        def post(path, body: {}, headers: {})
            self.class.post(path, body: , headers:)
        end
    end
end
