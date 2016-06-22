require 'twilio-ruby'

module ApplicationHelper

	def send_sms(to, body)

		number = current_user.mobile_number

		account_sid = ENV['TWILIO_ACCOUNT_SID']
		auth_token = ENV['TWILIO_AUTH_TOKEN']

		@client = Twilio::REST::Client.new account_sid, auth_token 

		@client.account.messages.create({
			:from => '+447481338812',  
			:to => number, 
			:body => body,
		}) 
		
	end

	def send_storage_sms(to, storage, key_auth_code)

		location = storage.location
		
	    name = location.name
	    address1 = location.address_line_1
	    address2 = location.address_line_2
	    parish = location.parish

	    # prepare message to be sent
	    body = "Please take your key to: #{name}, #{address1}, #{address2}, #{parish} and quote code: #{key_auth_code}"

	    # send message
	    send_sms(to, body)
	end

	def send_retrieval_sms(to, storage, key_auth_code)
		
		location = storage.location
		
	    name = location.name
	    address1 = location.address_line_1
	    address2 = location.address_line_2
	    parish = location.parish

	    # prepare message to be sent
	    body = "Please retrieve your key from: #{name}, #{address1}, #{address2}, #{parish} and quote code: #{key_auth_code}"

	    # send message
	    send_sms(to, body)
	end

	def validate_mobile(to)
		# TODO: Check that the number starts +44 and fix it if not

		return to
	end
end
