class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :label, default: 'user', index: true

      t.timestamps
    end

    create_join_table :roles, :users do |t|
      t.index [:role_id, :user_id]
    end
  end
end
