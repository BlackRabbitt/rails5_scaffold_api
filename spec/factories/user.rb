FactoryBot.define do
  factory :permission do
    resource_type "Role"
    action "create"
    factory :user_create_permission do
      resource_type "User"
      action "create"
    end
  end

  factory :role do
    label "role_manager"
    factory :role_manager_role do
      transient do
        permissions_count 1
      end
      after(:create) do |role, eval|
        create_list(:permission, eval.permissions_count, roles: [role])
      end
    end

    factory :user_manager_role do
      transient do
        permissions_count 1
      end

      after(:create) do |role, eval|
        create_list(:user_create_permission, eval.permissions_count, roles: [role])
      end
    end
  end

  factory :user do
    sequence(:email) { |n| "name_#{n}@example.com" }
    password "password@123"
    factory :role_manager do
      transient do
        # number of roles to create after superadmin user creates.
        roles_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:role_manager_role, evaluator.roles_count, users: [user])
      end
    end

    factory :user_manager do
      transient do
        roles_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:user_manager_role, evaluator.roles_count, users: [user])
      end
    end
  end
end
