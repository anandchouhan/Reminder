class Employee < ApplicationRecord
	belongs_to :admin 
	has_many :team_members, :dependent => :destroy
  has_many :teams, through: :team_members
  has_many :reminder, :dependent => :destroy

	validates :name, :date_of_birth, :presence => true 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validates_length_of :contact_no, :minimum => 10, :maximum => 10
  validates_format_of :avatar, :with => %r{\.(png|jpg|jpeg)}i, :message => "upload valid file type"
	
  mount_uploader :avatar, AvatarUploader
end
