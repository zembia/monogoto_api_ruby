# frozen_string_literal: true

module MonogotoApi
    class Event
        class List
            attr_reader :events, :counter

            def initialize
                @events = []
            end

            # Push event element to events array
            def push(event)
                push_result = @events.push(event)
                @counter = push_result.size
                push_result
            end

            # Parser of API events response
            def self.parse(resp_events)
                list = new
                resp_events.fetch("hits", {}).each { |event| list.push(MonogotoApi::Event.parse(event)) }
                list
            end
        end
    end
end
