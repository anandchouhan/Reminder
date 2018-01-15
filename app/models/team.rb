class Team < ApplicationRecord
	belongs_to :admin
	has_many :team_members, :dependent => :destroy
  has_many :employees, through: :team_members

	validates :name, :presence => true
	validates_length_of :name, :maximum => 50
  accepts_nested_attributes_for :team_members, allow_destroy: true
end
