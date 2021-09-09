# frozen_string_literal: true

module Gameye
  class Location
    def self.fetch(game_key:, client: Gameye::Client.new)
      locations = Gameye::Game.fetch(client: client)
      locations.find { |l| l.key == game_key }
    end
  end
end
