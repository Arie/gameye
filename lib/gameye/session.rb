# frozen_string_literal: true

module Gameye
  class Session
    attr_accessor :image, :id, :location, :host, :port, :tv_port

    def initialize(json)
      @image_key    = json['image']
      @match_key    = json['id']
      @location_key = json['location']
      @host         = json['host']
    end

    def self.start(location:, template:, id:, client: Gameye::Client.new, args: [], env: {})
      response = client.post(
        'session',
        {
          id: id,
          location: location,
          image: template,
          args: args,
          env: env,
          restart: false
        }
      )
      if response.status == 201 || response.status == 200
        JSON.parse(response.body)
      else
        response.status
      end
    end
  end
end
