class Key < ActiveRecord::Base

  belongs_to :user

  has_many :storages

end
