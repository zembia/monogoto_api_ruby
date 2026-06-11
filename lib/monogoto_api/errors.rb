# frozen_string_literal: true

module MonogotoApi
    # Base error class for Monogoto API library
    class Error < StandardError; end

    # Raised when a network or timeout connection error occurs
    class ConnectionError < Error; end

    # Base class for HTTP errors (non-2xx responses)
    class HTTPError < Error
        attr_reader :response

        def initialize(response)
            @response = response
            super("HTTP Request failed with status #{response.code}: #{response.body}")
        end
    end

    # Raised on 401 or 403 responses
    class UnauthorizedError < HTTPError; end

    # Raised on 404 responses
    class NotFoundError < HTTPError; end

    # Raised on 5xx server responses
    class ServerError < HTTPError; end
end
