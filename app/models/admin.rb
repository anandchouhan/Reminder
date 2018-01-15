class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :rememberable, :trackable, :validatable
  has_many :employees, :dependent => :destroy 
  has_many :teams, :dependent => :destroy 
  has_many :team_members, :dependent => :destroy
  has_many :reminders, :dependent => :destroy 
  
  enum designation: {"director": "director", "hr": "hr"}

end
