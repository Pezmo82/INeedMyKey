class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, confirmation: true
  validates :mobile_number, confirmation: true, presence: true

  has_many :keys
  belongs_to :rank

  private
  def confirmation_token
  	if self.confirm_token.blank?
  		self.confirm_token = SecureRandom.urlsafe_base64.to_s
  	end
  end
end
