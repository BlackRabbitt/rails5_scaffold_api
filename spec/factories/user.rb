FactoryBot.define do
  factory :role do
    label "super_admin"
  end

  factory :user do
    sequence(:email) { |n| "name_#{n}@example.com" }
    password "password@123"

    factory :user_with_superadmin_roles do
      transient do
        # number of roles to create after superadmin user creates.
        roles_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:role, evaluator.roles_count, users: [user])
      end
    end
  end
end
