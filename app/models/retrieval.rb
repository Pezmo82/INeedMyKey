class Retrieval < ActiveRecord::Base
	belongs_to :key
 	belongs_to :location
 	belongs_to :storage
end
