class InvoiceItem < ActiveRecord::Base
	attr_accessible :item_title, :item_desc, :item_amount
	belongs_to :invoice
	
	validates_presence_of :item_title
	validates :item_amount, presence: true, :numericality => { :only_integer => true }
end
