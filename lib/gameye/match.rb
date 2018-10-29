module Gameye
  class Match

    def self.start(client, game_key:, location_keys:, template_key:, match_key:, options: {})
      client.post("action/start-match", {
        gameKey: game_key,
        locationKeys: location_keys,
        templateKey: template_key,
        matchKey: match_key,
        config: options
      })
    end

    def self.stop(client, match_key:)
      client.post("action/stop-match", {
        matchKey: match_key
      })
    end
  end
end
