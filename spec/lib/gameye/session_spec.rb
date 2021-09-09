require 'spec_helper'


module Gameye

  describe Session do

    it "starts a session", :vcr do
      response = described_class.start(id: "serveme-test-123", location: "eu-east", template: "serveme-tf2-live", args: [])
      expect(response).to be {}
      expect(response["host"]).to eql "5.83.175.103"
      expect(response["ports"]).to eql []
    end
  end
end
