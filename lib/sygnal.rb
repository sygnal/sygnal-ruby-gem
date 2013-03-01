# @author Loren Segal

require 'net/http'
require 'uri'
require 'rubygems'
require 'json'

class SygnalGenerator

	# @param [Integer] sygnal_type_id the sygnal type id (create a new SygnalType at Sygnal.io)
	# @param [String] access_token the api access token (get one at Sygnal.io)
	def initialize(sygnal_type_id, access_token)
		@access_token = access_token
		@sygnal_type_id = sygnal_type_id
	end

	# @return [String] the SygnalGenerators access token
	def access_token
		return @access_token
	end

	# @return [Integer] the SygnalGenerators access token
	def sygnal_type_id
		return @sygnal_type_id
	end

	# @param [String] message the message body of the Sygnal
	# @return [Net::HTTPResponse] a Net:HTTP response object (this is temporary and should be fixed asap)
	def generate_sygnal(message)
	  
	  uri = URI.parse("http://www.sygnal.io/api/v1/sygnals")

	  post_params = { 
	    :sygnal_type_id => @sygnal_type_id,
	    :message => message
	  }
	 
	  request = Net::HTTP::Post.new(uri.path)
	  request.body = JSON.generate(post_params)
	  request.add_field("Content-Type", "application/json")
	  request.add_field("Authorization", "Token token=#{@access_token}")
	  
	  http = Net::HTTP.new(uri.host, uri.port)
	  #http.set_debug_output $stdout #useful to see the raw messages going over the wire

	  response = http.request(request)

	  return response
	end
end