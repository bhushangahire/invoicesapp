class Invoice < ActiveRecord::Base
	attr_accessible :client_id, :project_title, :notes, :invoice_items_attributes
	has_many :invoice_items
	accepts_nested_attributes_for :invoice_items
	
	validates :client_id, presence: true, :numericality => { :only_integer => true }
	
end
