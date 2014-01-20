class Invoice < ActiveRecord::Base
	attr_accessible :client_id, :project_title, :notes, :invoice_items_attributes, :slug, :user_id, :currency_id, :invoice_type, :invoice_status_id
	has_many :invoice_items, dependent: :destroy
	has_one :currency
	accepts_nested_attributes_for :invoice_items, :reject_if => lambda { |a| a[:item_title].blank? }, 
																 allow_destroy: true
	belongs_to :client
	belongs_to :user
	
	validates :client_id, presence: true, :numericality => { :only_integer => true }
	validates_presence_of :project_title
	validates_presence_of :currency_id
	validates_presence_of :invoice_type
	
	before_save do |invoice| 
		client = Client.find_by_id(invoice.client_id)
		invoice.slug = "#{client.name.parameterize}-#{invoice.id}-#{invoice.project_title.parameterize}"
	end
	
	
	def to_param
		slug
	end
	
	def total_price
	    invoice_items.to_a.sum(:item_amount)
	end
	
#	def mark_paid
#		@invoice = Invoice.find_by_id(params[:id])
#		@invoice.paid = true
#		@invoice.save
#		redirect_to @invoice
#	end
	
end
