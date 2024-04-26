# frozen_string_literal: true

module MonogotoApi
    class Ping
        class List
            attr_reader :pings

            def initialize
                @pings = []
            end

            def push(ping)
                @pings.push(ping)
            end

            def self.parse(hash_pings)
                list = new
                hash_pings.each { |ping| list.push(MonogotoApi::Ping.parse(ping)) }
                list
            end

            def packet_loss
                @pings.map(&:packet_loss).max
            end

            def received
                @pings.map(&:received).max
            end

            def ok?
                packet_loss.zero?
            end
        end
    end
end
