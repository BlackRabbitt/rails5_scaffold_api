class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :resource_type

      t.string :action

      t.timestamps
    end

    create_join_table :roles, :permissions do |t|
      t.index [:role_id, :permission_id]
    end
  end
end
