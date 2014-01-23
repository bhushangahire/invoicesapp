class Client < ActiveRecord::Base
	attr_accessible :name, :address, :user_id, :email
	has_many :invoices
	belongs_to :user
	
	validates_presence_of :name
	validates_presence_of :email
end
