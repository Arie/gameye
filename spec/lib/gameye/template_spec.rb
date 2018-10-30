require 'spec_helper'


module Gameye

  describe Template do

    it "fetches template information for a game", :vcr do
      templates = described_class.fetch(game_key: "csgo")

      expect(templates.size).to eql(18)

      template = templates.first
      expect(template.key).to eql("2v2wingman")
      expect(template.arguments.size).to eql(20)

      argument = template.arguments.first
      expect(argument.name).to eql "tickRate"
      expect(argument.type).to eql "number"
      expect(argument.defaultValue).to eql 128
      expect(argument.option).to eql [64, 128]
    end

  end
end
