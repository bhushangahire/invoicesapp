FactoryGirl.define do
	factory :invoice do
		sequence(:project_title) { |n| "Project #{n}" }
		sequence(:notes) { |n| "Note#{n}" }
		client_id 1
	end

end