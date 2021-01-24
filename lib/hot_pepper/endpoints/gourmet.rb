# frozen_string_literal: true

module HotPepper
  module Endpoints
    module Gourmet
      def gourmet(options = {})
        get("gourmet/v1?key=#{api_key}&format=json&#{generate_query(options)}")
      end
    end
  end
end
