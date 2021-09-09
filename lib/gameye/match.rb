module Gameye
  class Match

    attr_accessor :game_key, :match_key, :location_key, :host, :port, :tv_port, :created
    def initialize(json)
      @game_key     = json["gameKey"]
      @match_key    = json["matchKey"]
      @location_key = json["locationKey"]
      @host         = json["host"]
      @port         = json["port"]["game"]
      @tv_port      = json["port"]["stv"] || json["port"]["hltv"]
      @created      = Time.at((json["created"] / 1000.0).to_i)
    end

    def self.start(client: Gameye::Client.new, game_key:, location_keys:, template_key:, match_key:, options: {})
      response = client.post("action/start-match", {
        gameKey: game_key,
        locationKeys: location_keys,
        templateKey: template_key,
        matchKey: match_key,
        config: options
      })
      if (response.status == 204 || response.status == 200)
        JSON.parse(response.body)
      else
        response.status
      end
    end

    def self.stop(client: Gameye::Client.new, match_key:)
      response = client.post("action/stop-match", { matchKey: match_key })
      if (response.status == 204 || response.status == 200)
        true
      else
        response.status
      end
    end

    def self.all(client: Gameye::Client.new)
      response = client.get("match", "query")
      if response["match"]
        response["match"].map { |m| new(m[1]) if !m[1].nil? }
      end
    end
  end
end
