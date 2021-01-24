# frozen_string_literal: true

module HotPepper
  module Query
    def generate_query(options)
      Hashie::Mash.new(options).map{|k, v| "#{k}=#{v}"}.join('&')
    end
  end
end
