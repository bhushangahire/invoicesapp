class InvoiceItem < ActiveRecord::Base
	attr_accessible :item_title
	belongs_to :invoice
end
