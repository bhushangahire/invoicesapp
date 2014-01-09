require 'spec_helper'

describe Invoice do
  
  before do
  	@invoice = Invoice.new(project_title: "Test Project", client_id: 1, notes: "This is a note")
#	@invoice = FactoryGirl.create(:invoice)
  end
  
  subject { @invoice }
  
  it { should respond_to(:project_title) }
  it { should respond_to(:client_id) }
  it { should respond_to(:notes) }  
  it { should respond_to(:slug) }
  
end
