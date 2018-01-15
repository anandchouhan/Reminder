class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.integer :employee_id
      t.integer :admin_id
      t.datetime :reminder_at
      t.text :message
      t.string :title
      t.string :status
      t.timestamps
    end
  end
end
