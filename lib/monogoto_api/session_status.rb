# frozen_string_literal: true

module MonogotoApi
    class SessionStatus
        attr_reader :connection, :provision

        def initialize(**attributes)
            @provision = attributes[:provision]
            @connection = attributes[:connection]
        end

        def self.parse(hash_session)
            data_first = hash_session["Data"].first
            new(
                provision: data_first["ProvisionStatus"],
                connection: data_first["ConnectionStatus"]
            )
        end
    end
end
