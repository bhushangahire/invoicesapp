class Invoice < ActiveRecord::Base
	attr_accessible :client_id, :project_title, :notes, :invoice_items_attributes, :slug
	has_many :invoice_items, dependent: :destroy
	accepts_nested_attributes_for :invoice_items, :reject_if => lambda { |a| a[:item_title].blank? }
	
	validates :client_id, presence: true, :numericality => { :only_integer => true }
	validates_presence_of :project_title
	
	before_save do |invoice| 
		client = Client.find_by_id(invoice.client_id)
		invoice.slug = "#{client.name.parameterize}-#{invoice.id}-#{invoice.project_title.parameterize}"
	
	end
	
	
	def to_param
		slug
	end

	
end
