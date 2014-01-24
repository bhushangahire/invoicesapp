class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_many :clients, dependent: :destroy
	has_many :invoices, dependent: :destroy
	has_secure_password
	
	before_save :create_remember_token
	
	validates :name, presence: true, length: { maximum: 50 }
	validates :password, presence: true, length: { minimum: 10 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
							uniqueness: { case_sensitive: false }
	
	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
