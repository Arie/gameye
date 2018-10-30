require 'spec_helper'


module Gameye

  describe Game do

    it "fetches game information", :vcr do
      response = described_class.fetch

      expect(response.size).to eql(5)
      expect(response.first.key).to eql("csgo")
      expect(response.first.locations).to eql(["rotterdam", "los_angeles", "washington_dc", "frankfurt"])
    end

  end
end
