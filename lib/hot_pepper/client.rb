# frozen_string_literal: true

require "hashie"
require "faraday"
require "json"
require "faraday_middleware"
require "faraday/encoding"
require_relative "endpoints"

module HotPepper
  class Client
    include Endpoints

    attr_accessor :endpoint, :api_key, :default_max_retries, :client

    def initialize(options = {})
      HotPepper::Config::ATTRIBUTES.each do |key|
        send("#{key}=", options.fetch(key, HotPepper.config.send(key)))
      end
      @api_key ||= HotPepper.config.api_key
      @client = Faraday.new(url: endpoint) do |conn|
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        conn.response :encoding
        conn.adapter Faraday.default_adapter
      end
    end

    Faraday::Connection::METHODS.each do |method|
      define_method(method) do |url, args = {}|
        response = client.__send__(method, url, args.reject { |_k, v| v.nil? }).body
        Hashie::Mash.new(JSON.parse(response))
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
end
