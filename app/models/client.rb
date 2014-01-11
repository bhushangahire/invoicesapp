class Client < ActiveRecord::Base
	attr_accessible :name, :address, :user_id
	has_many :invoices
	belongs_to :user
end
