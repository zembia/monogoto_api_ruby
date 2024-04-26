# frozen_string_literal: true

module MonogotoApi
    class IP
        attr_reader :ip, :ip_allocation_policy, :ip_lock, :ipv_type

        def initialize(**attributes)
            @ip                   = attributes[:ip]
            @ip_allocation_policy = attributes[:ip_allocation_policy]
            @ip_lock              = attributes[:ip_lock]
            @ipv_type             = attributes[:ipv_type]
        end

        def self.parse_many(response)
            output = []
            response.each do |pre_ip|
                output.push(parse(pre_ip))
            end
            output
        end

        def self.parse(hash_ip)
            new(
                ip: hash_ip["IP"],
                ip_allocation_policy: hash_ip["IPAllocationPolicy"],
                ip_lock: hash_ip["IPLock"],
                ipv_type: hash_ip["IPvType"]
            )
        end
    end
end
