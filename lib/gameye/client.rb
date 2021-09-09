require 'json'
require 'faraday'

module Gameye
  class Client

    attr_writer :endpoint, :token

    def token
      @token || Gameye.token
    end

    def endpoint
      @endpoint || Gameye.endpoint
    end

    def connection
      Faraday.new(:url => endpoint) do |conn|
        conn.request :url_encoded
        conn.adapter :net_http
      end
    end

    def post(path, params)
      connection.post do |req|
        req.url "/#{path}"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "Bearer #{token}"
        req.body = params.to_json
      end
    end

    def get(path, method = "fetch")
      response = connection.get do |req|
        req.url "/#{method}/#{path}"
        req.headers['Authorization'] = "Bearer #{token}"
      end
      if response.success?
        JSON.parse(response.body)
      end
    end
  end
end
