class InvoiceItem < ActiveRecord::Base
	belongs_to :invoice
	
	validates_presence_of :item_title
	validates :item_amount, presence: true, :numericality => { :only_integer => true }
end
