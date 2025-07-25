# frozen_string_literal: true

require_relative "lib/monogoto_api/version"

Gem::Specification.new do |spec|
    spec.name                  = "monogoto_api"
    spec.version               = MonogotoApi::VERSION
    spec.authors               = ["Javier Contreras Ferrada"]
    spec.email                 = [""]
    spec.summary               = "Unofficial Ruby gem for Monogoto API"
    spec.description           = "Unofficial Ruby gem for Monogoto API. Monogoto is a IoT connectivity management platform"
    spec.homepage              = "https://github.com/zembia/monogoto_api_ruby"
    spec.license               = "MIT"
    spec.files                 = Dir["lib/**/*.rb"]
    spec.require_paths         = ["lib"]
    spec.required_ruby_version = ">= 2.6"
    spec.metadata = {
        "rubygems_mfa_required" => "true"
    }
    spec.add_dependency "httparty", "~> 0.21", ">= 0.21.0"
    if RUBY_VERSION >= "3.4.0"
        spec.add_dependency "base64"
        spec.add_dependency "csv"
    end
end
