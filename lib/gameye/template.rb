module Gameye
  class Template

    attr_accessor :key, :arguments, :maps
    def initialize(json)
      @key        = json[0]
      @arguments  = json[1]["arg"].map { |a| OpenStruct.new(a) }
      @maps       = named_argument("map")["option"]
    end

    def self.fetch(client:, game_key:)
      response = client.get("template?gameKey=#{game_key}")
      response["template"].map { |t| new(t) }
    end

    private

    def named_argument(name)
      arguments.find { |key| key["name"] == name }
    end

  end
end
