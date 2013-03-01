Sygnal Ruby Gem
====================
A gem for generating market-based event notifications via Sygnal.io API


Installation
------------
	gem install sygnal


Sample Application
------------------
	
	require 'sygnal'

	sygnal_type_id = 2
	api_key = 'your_api_key'

	s = SygnalGenerator.new(sygnal_type_id, api_key)

	#create a theoretical event loop here that predicts if S&P 500 is likely to close near high of the day
	if s_and_p_close_near_high_probability > 0.8
	
		s.generate_sygnal('S&P has an 80% liklihood of closing within 0.2% of the high of the day.')

	end