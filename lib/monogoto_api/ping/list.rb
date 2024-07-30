# frozen_string_literal: true

module MonogotoApi
    class Ping
        class List
            attr_reader :pings

            def initialize
                @pings = []
            end

            # Push ping element to pings array
            def push(ping)
                @pings.push(ping)
            end

            # Parser of API ping response
            # "/thing/ThingId_ICCID_#{ iccid }/ping"
            def self.parse(hash_pings)
                list = new
                hash_pings.each { |ping| list.push(MonogotoApi::Ping.parse(ping)) }
                list
            end

            # Extract packet loss counter of ping list
            def packet_loss
                @pings.map(&:packet_loss).max
            end

            # Extract received counter of ping list
            def received
                @pings.map(&:received).max
            end

            # Check if are any packet loss in any ping
            def ok?
                packet_loss.zero?
            end
        end
    end
end
