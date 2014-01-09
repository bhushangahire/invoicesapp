require 'spec_helper'

describe "Static Pages" do
	
	let(:invoice) { FactoryGirl.create(:invoice) }

	subject { page }
	
	describe "Home page" do
		before { visit root_path }
		
		it { should have_selector('h1', text: 'Invoice App') }
		it { should have_title(full_title('')) }
		
	end
	
	describe "Visiting the Invoices page" do
		before { visit invoices_path }
		
		it { should have_selector('h1', text: "Listing invoices") }
		it { should have_title(full_title('All Invoices')) }
		
		describe "and creating a new Invoice" do
			before { click_link "New Invoice" }
			
			it { should have_selector('h1', "New invoice") }
			it { should have_selector('input[value="Create Invoice"]') }
			
			describe "and click create invoice" do
				before do 
					fill_in "Project title", with: "Project 1"
					fill_in "Notes",         with: "Test Note"
					select "Lisbon",              from: "invoice_client_id"
					fill_in "invoice_invoice_items_attributes_0_item_title",    with: "Item Description"
					click_button "Create Invoice" 
				end
				
				describe "after saving an invoice" do

					let(:invoice) { Invoice.find_by_project_title("Project 1") }
					it { should have_selector('a', text: invoice.project_title) }
				end
				
			end
			
		end
		
	end

end
