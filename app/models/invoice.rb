class Invoice < ActiveRecord::Base
	belongs_to :client
	
	validates :client_id, presence: true
end
