class Addbirthdatetoemployees < ActiveRecord::Migration[5.0]
  def change
  	add_column :employees, :date_of_birth, :date
  end
end
