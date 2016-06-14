class Key < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
  has_many :storages
end
