class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name, index: true
      t.string :subdomain, index: true

      t.timestamps
    end
  end
end
