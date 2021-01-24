# frozen_string_literal: true

module HotPepper
  module Config
    extend self

    ATTRIBUTES = %i[
      endpoint
      api_key
      default_max_retries
    ].freeze

    attr_accessor(*Config::ATTRIBUTES)

    def reset
      self.endpoint = "https://webservice.recruit.co.jp/hotpepper/"
      self.api_key = nil
      self.default_max_retries = 10
    end
  end

  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end
end
HotPepper::Config.reset
