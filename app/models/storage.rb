class Storage < ActiveRecord::Base
	belongs_to :key
	belongs_to :location
end
