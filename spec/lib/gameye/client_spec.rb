require 'spec_helper'

module Gameye

  describe Client do

    after(:each) do
      Gameye.endpoint = nil
    end

    it "can use an overriden endpoint" do
      endpoint = "https://my-special-endpoint.localhost"
      Gameye.endpoint = endpoint
      expect(Gameye::Client.new.endpoint).to eql(endpoint)
    end

  end
end
