# frozen_string_literal: true

module MonogotoApi
    class Ping
        attr_reader :host, :size, :ttl, :time, :sent, :received, :packet_loss

        def initialize(**attributes)
            @host        = attributes[:host]
            @size        = attributes[:size]
            @ttl         = attributes[:ttl]
            @time        = attributes[:time]
            @sent        = attributes[:sent]
            @received    = attributes[:received]
            @packet_loss = attributes[:packet_loss]
        end

        def self.parse_many(response)
            output = []
            response.each do |pre_ip|
                output.push(parse(pre_ip))
            end
            output
        end

        # Parser of single element of API ping response
        def self.parse(hash_ping)
            new(
                host: hash_ping["host"],
                size: hash_ping["size"].to_i,
                ttl: hash_ping["ttl"].to_i,
                time: hash_ping["time"],
                sent: hash_ping["sent"].to_i,
                received: hash_ping["received"].to_i,
                packet_loss: hash_ping["packetLoss"].to_i
            )
        end
    end
end
