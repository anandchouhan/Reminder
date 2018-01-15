class AddtemplateIdtoreminders < ActiveRecord::Migration[5.0]
  def change
  	add_column :reminders, :message_template_id, :integer
  end
end
