class NotificationsController < ApplicationController

  	rescue_from StandardError do |exception|
    	trigger_sms_alerts(exception)
  	end

	def trigger_sms_alerts(e)
		@alert_message = "
	  		[This is a test] ALERT! 
	  		It appears the server is having issues. 
	  		Exception: #{e}. 
	  		Go to: http://newrelic.com for more details."
		@image_url = "http://howtodocs.s3.amazonaws.com/new-relic-monitor.png"
		@admin_list = YAML.load_file('config/administrators.yml')

	begin
	  	@admin_list.each do |admin|
	    	phone_number = admin['phone_number']
	    	send_message(phone_number, @alert_message, @image_url)
	  	end
	  
	  	flash[:success] = "Exception: #{e}. Administrators will be notified."

		rescue
	  		flash[:alert] = "Something went wrong."
		end

		redirect_to '/'
	end

	def index
	end

	def server_error
		raise 'A test exception'
	end

  		private

    		def send_message(phone_number, alert_message, image_url)
				@twilio_number = ENV['TWILIO_NUMBER']
      			@client = Twilio::REST::Client.new ENV['ACf383540749375aadf02ddee8c9d0f495'], ENV['31af4f8fde47b325fae3818711063f54']
      
      			message = @client.account.messages.create(
		        :from => @twilio_number,
		        :to => phone_number,
		        :body => alert_message,
		        # US phone numbers can make use of an image as well.
		        # :media_url => image_url 
		      	)
		      	puts message.to
		    end
end
