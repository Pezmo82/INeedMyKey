class UserMailer < ActionMailer::base
	default :from => "noreply@mydomain.com"

	def registration_confirmation(user)

		@user = user
		mail(:to => "#{user.name} <#{user.email}>", :subject => "Please confirm your registration")

	end

end
