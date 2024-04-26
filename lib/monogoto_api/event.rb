# frozen_string_literal: true

module MonogotoApi
    class Event
        def initialize(**attributes)
            @severity  = attributes[:severity]
            @msg       = attributes[:msg]
            @msg_type  = attributes[:msg_type]
            @timestamp = attributes[:timestamp]
            @data_type = attributes[:data_type]
        end

        def self.parse(hash_event)
            data_first = hash_event["_source"]
            new(
                severity: data_first["Severity"],
                msg: data_first["message"],
                msg_type: data_first["MessageType"],
                timestamp: Time.at(data_first["Timestamp"] / 1_000),
                data_type: data_first["EsDataType"]
            )
        end

        def self.parse_many(hits)
            output = []
            hits.each { |pre_event| output.push(parse(pre_event)) }
            output
        end
    end
end
