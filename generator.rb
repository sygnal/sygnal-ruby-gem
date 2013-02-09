require 'net/http'
require 'uri'
require 'rubygems'
require 'json'

class SygnalGenerator

	def initialize(access_token, sygnal_type_id)
		@access_token = access_token
		@sygnal_type_id = sygnal_type_id
	end

	def generate_sygnal
	  
	  uri = URI.parse("http://serene-spire-5496.herokuapp.com//api/v1/sygnals")

	  post_params = { 
	  	:access_token => @access_token,
	    :sygnal_type_id => @sygnal_type_id
	  }
	 
	  request = Net::HTTP::Post.new(uri.path)
	  request.body = JSON.generate(post_params)
	  request["Content-Type"] = "application/json"
	  
	  http = Net::HTTP.new(uri.host, uri.port)
	  http.set_debug_output $stdout #useful to see the raw messages going over the wire

	  response = http.request(request)

	  puts response.body
	end
end

sygnal_one_generator = SygnalGenerator.new("c63b3c0dea5a48ff70a0ff409ae0c067", "1")
sygnal_one_generator.generate_sygnal