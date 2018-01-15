class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :contact_no
      t.string :avatar
      t.integer :admin_id
      t.timestamps
    end
  end
end
