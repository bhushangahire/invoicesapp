FactoryGirl.define do
	factory :invoice do
		sequence(:project_title) { |n| "Project #{n}" }
		sequence(:notes) { |n| "Note#{n}" }
		client_id 1
	end
	
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "iomega"
		password_confirmation "iomega"
	end
end