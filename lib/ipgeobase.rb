# frozen_string_literal: true

require_relative 'ipgeobase/version'
require 'addressable/template'
require 'happymapper'
require 'httparty'

# This module is used to get information about IP address
module Ipgeobase
  class Meta
    include HappyMapper

    tag 'query'
    element :country, String
    element :countryCode, String
    element :city, String
    element :lat, Float
    element :lon, Float
  end

  class << self
    def lookup(ip_address)
      base_url = 'http://ip-api.com'
      template = Addressable::Template.new("#{base_url}{/segments*}{?query*}")
      api_url = template.expand(segments: ['xml', ip_address], query: { fields: 'country,countryCode,city,lat,lon' })
      response = HTTParty.get(api_url)

      response['query'].nil? ? 'invalid ip address' : Meta.parse(response.body, single: true)
    end
  end
end
