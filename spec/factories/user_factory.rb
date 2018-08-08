FactoryBot.define do
    sequence(:email) { |n|  "useruser#{n}@example#{n}.com" }
    sequence(:password) { |n| "useruser#{n}" }
    sequence(:first_name) { |n| "user#{n}" }
    sequence(:last_name) { |n| "example#{n}"}
    factory :user, class: User do
        email 
        password 
        first_name 
        last_name
        admin false
    end
    factory :admin, class: User do
        email 
        password 
        first_name 'admin'
        last_name 'admin'
        admin true
    end
end