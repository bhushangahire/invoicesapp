class Client < ActiveRecord::Base
	has_many :invoices
	belongs_to :user
	
	validates_presence_of :name
	validates_presence_of :email
end
