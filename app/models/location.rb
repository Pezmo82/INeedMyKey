class Location < ActiveRecord::Base
  belongs_to :rank
  has_many :keys
end
