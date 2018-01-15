class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.integer :admin_id
      t.integer :team_id
      t.integer :employee_id
      t.timestamps
    end
  end
end
