module Gameye
  class Location
    def self.fetch(client:, game_key:)
      locations = Gameye::Game.fetch(client: client)
      locations.find { |l| l.key == game_key }
    end
  end
end
