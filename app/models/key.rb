class Key < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
  	has_many :storages
  	has_many :retrievals

  	def get_state
  		storage = self.storages.first

  		if !storage
  			return "Unstored"
  		elsif storage.to_drop
  			return "Drop to location"
  		elsif storage.is_stored
  			return "Key is stored"
  		elsif storage.to_collect
  			return "Collect from location"
  		elsif storage.was_retrieved
  			return "Retrieved"
  		else 
  			return "unknown"
  		end

  	end

end
