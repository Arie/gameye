module Gameye
  class Game

    attr_accessor :client

    def initialize(client)
      @client = client
    end

    def fetch
      response = connection.get('/fetch/game')
      if response.success?
      end
    end

  end
end
