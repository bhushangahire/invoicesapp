require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ApplicationHelper do
	
	describe "full_title" do
		
		it "should include the page title" do
			full_title('foo').should =~ /foo/
		end
		
		it "should include the base title" do
			full_title('foo').should =~ /^Hash Cookies Invoice App/
		end
		
		it "should not include a bar on the home page" do
			full_title('').should_not =~ /\|/
		end
		
	end
	
end
