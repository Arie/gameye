require "gameye/version"
require "gameye/client"
require "gameye/template"
require "gameye/game"
require "gameye/location"
require "gameye/match"

module Gameye
  class << self
    def token=(token)
      @token = token
    end

    def token
      @token || raise(StandardError, "No Gameye API token set")
    end

    def endpoint=(endpoint)
      @endpoint = endpoint
    end

    def endpoint
      @endpoint || "https://api.gameye.com"
    end
  end
end
