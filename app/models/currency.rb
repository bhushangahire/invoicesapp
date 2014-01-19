class Currency < ActiveRecord::Base
	
	belongs_to :invoice
	
end
