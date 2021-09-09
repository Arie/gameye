# frozen_string_literal: true

require 'gameye/version'
require 'gameye/client'
require 'gameye/template'
require 'gameye/game'
require 'gameye/location'
require 'gameye/match'

module Gameye
  class << self
    attr_writer :token, :endpoint

    def token
      @token || raise(StandardError, 'No Gameye API token set')
    end

    def endpoint
      @endpoint || 'https://api.gameye.com'
    end
  end
end
