require 'spec_helper'


module Gameye

  describe Match do

    it "fetches an empty list of matches", :vcr do
      matches = described_class.all

      expect(matches).to eql([])
    end

    it "starts a match", :vcr do
      response = described_class.start(game_key: "tf2", match_key: "serveme-test-123", location_keys: ["rotterdam"], template_key: "bots", options: {hostname: "Foobarwidget"})
      expect(response).to be true
    end

    it "fetches matches", :vcr do
      matches = described_class.all

      expect(matches.size).to eql(1)

      match = matches.first
      expect(match.game_key).to eql("tf2")
      expect(match.host).to eql("213.163.71.11")
      expect(match.location_key).to eql("rotterdam")
      expect(match.port).to eql(56494)
      expect(match.tv_port).to eql(61828)
      expect(match.created.to_s).to eql("2018-10-30 19:48:39 +0100")
    end

    it "returns the status if the match couldn't be started", :vcr do
      response = described_class.start(game_key: "tf2", match_key: "duplicate", location_keys: ["rotterdam"], template_key: "bots", options: {hostname: "Foobarwidget"})
      expect(response).to eql 500
    end

    it "stop a running match", :vcr do
      response = described_class.stop(match_key: "serveme-test-123")
      expect(response).to be true
    end

    it "returns the status if the running match couldn't be stopped", :vcr do
      response = described_class.stop(match_key: "serveme-test-123")
      expect(response).to eql 404
    end

  end
end
