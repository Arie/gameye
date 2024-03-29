# frozen_string_literal: true

module Gameye
  class Game
    attr_accessor :key, :locations

    def initialize(json)
      @key        = json['gameKey']
      @locations  = json['location'].keys
    end

    def self.fetch(client: Gameye::Client.new)
      response = client.get('game')
      response['game'].map { |g| new(g[1]) }
    end
  end
end
