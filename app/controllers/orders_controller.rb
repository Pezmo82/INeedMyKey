class OrdersController < ApplicationController
	
	def new
	  	@client_token = Braintree::ClientToken.generate
	end

	def create
	  	nonce = params[:payment_method_nonce]
	  	render action: :new and return unless nonce
	  	result = Braintree::Transaction.sale(
	    	amount: "1.00",
	    	payment_method_nonce: nonce
	  	)

	  	flash[:notice] = "Payment Successful. An email and SMS will be sent to you." if result.success?
	  	flash[:alert] = "Payment Failed. #{result.transaction.processor_response_text}" unless result.success?
	  	redirect_to action: :new
	end

end
