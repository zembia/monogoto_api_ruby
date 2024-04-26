# frozen_string_literal: true

module MonogotoApi
    class Thing
        attr_reader :iccid, :imei, :operator, :state, :name, :ips

        def initialize(**attributes)
            @iccid    = attributes[:iccid]
            @imei     = attributes[:imei]
            @operator = attributes[:operator]
            @state    = attributes[:state]
            @name     = attributes[:name]
            @ips      = attributes[:ips]
        end

        def self.parse_many(response)
            output = []
            response.each do |pre_thing|
                output.push(parse(pre_thing))
            end
            output
        end

        def self.parse(hash_thing)
            ips = MonogotoApi::IP.parse_many(hash_thing["IPs"])
            new(
                imei: hash_thing["IMEI"],
                name: hash_thing["ThingName"],
                iccid: hash_thing["ExternalUniqueId"],
                operator: hash_thing["MnoName"],
                state: hash_thing["State"],
                ips:
            )
        end

        def ip
            @ips.first.ip
        end
    end
end
