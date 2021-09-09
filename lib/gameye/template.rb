# frozen_string_literal: true

module Gameye
  class Template
    attr_accessor :key, :arguments, :maps

    def initialize(json)
      @key        = json[0]
      args        = json[1]['arg'] || []
      @arguments  = args.map { |a| OpenStruct.new(a) }
      @maps       = named_argument('map')['option']
    end

    def self.fetch(game_key:, client: Gameye::Client.new)
      response = client.get("template?gameKey=#{game_key}")
      response['template'].map { |t| new(t) }
    end

    private

    def named_argument(name)
      arguments.find { |key| key['name'] == name } || {}
    end
  end
end
