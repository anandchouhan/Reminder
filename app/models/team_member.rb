class TeamMember < ApplicationRecord
	belongs_to :admin
	belongs_to :team
	belongs_to :employee
	validates :employee_id, :presence => true
	validates :team_id, :presence => true
 end
