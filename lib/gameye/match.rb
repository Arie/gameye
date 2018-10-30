module Gameye
  class Match

    attr_accessor :game_key, :location_key, :host, :port, :tv_port, :created
    def initialize(json)
      @game_key     = json["gameKey"]
      @match_key    = json["matchKey"]
      @location_key = json["locationKey"]
      @host         = json["host"]
      @port         = json["port"]["game"]
      @tv_port      = json["port"]["hltv"]
      @created      = Time.at((json["created"] / 1000.0).to_i)
    end

    def self.start(client: Gameye::Client.new, game_key:, location_keys:, template_key:, match_key:, options: {})
      response = client.post("start-match", {
        gameKey: game_key,
        locationKeys: location_keys,
        templateKey: template_key,
        matchKey: match_key,
        config: options
      })
      if response.status == 204
        true
      else
        response
      end
    end

    def self.stop(client: Gameye::Client.new, match_key:)
      response = client.post("stop-match", { matchKey: match_key })
      if response.status == 204
        true
      else
        response
      end
    end

    def self.all(client: Gameye::Client.new)
      response = client.get("match")
      if response["match"]
        response["match"].map { |m| new(m[1]) }
      else
        []
      end
    end
  end
end
