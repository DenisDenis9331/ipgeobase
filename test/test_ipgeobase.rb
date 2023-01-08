# frozen_string_literal: true

require 'test_helper'
WebMock.disable_net_connect!(allow: ['http://ip-api.com'])

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_valid_ip
    response_body = <<~XML
      <query>
        <country>Australia</country>
        <countryCode>AU</countryCode>
        <city>South Brisbane</city>
        <lat>-27.4767</lat>
        <lon>153.017</lon>
      </query>
    XML
    stub_request(:get, 'http://ip-api.com/xml/1.2.3.4?fields=country,countryCode,city,lat,lon')
      .to_return(status: 200, body: response_body)

    meta = Ipgeobase.lookup('1.2.3.4')
    assert_equal 'South Brisbane', meta.city
    assert_equal 'Australia', meta.country
    assert_equal 'AU', meta.countryCode
    assert_equal(-27.4767, meta.lat)
    assert_equal 153.017, meta.lon
  end

  def test_invalid_ip
    response_body = <<~XML
      <query>
        <status>fail</status>
        <message>invalid query</message>
        <query>123.456.789.012</query>
      </query>
    XML
    stub_request(:get, 'http://ip-api.com/xml/123.456.789.012').to_return(status: 200, body: response_body)

    meta = Ipgeobase.lookup('123.456.789.012')
    assert_equal 'invalid ip address', meta
  end
end
