class User < ActiveRecord::Base
	devise :database_authenticatable, :confirmable ...
end