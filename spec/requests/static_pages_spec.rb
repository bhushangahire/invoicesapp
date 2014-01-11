require 'spec_helper'

describe "Static Pages" do
	
	let(:invoice) { FactoryGirl.create(:invoice) }

	subject { page }
	
	describe "Home page" do
		before { visit root_path }
		
		it { should have_selector('h1', text: 'Invoice App') }
		it { should have_title(full_title('')) }
		
		describe "for signed in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				sign_in user
				visit root_path
			end
			
			it { should have_selector('li', text: 'Clients') }
			
		end
		
	end
	
end
