require 'spec_helper'

module Gameye

  describe Location do

    it "fetches location information for a game", :vcr do
      game = described_class.fetch(game_key: "tf2")

      expect(game.key).to eql("tf2")
      expect(game.locations).to eql(["rotterdam", "los_angeles", "washington_dc", "frankfurt"])
    end

  end
end
