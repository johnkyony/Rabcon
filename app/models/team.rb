class Team < ActiveRecord::Base
  belongs_to :deparment
  has_many :team_members
  has_many :team_leaders
  validates :name , presence: true
  validates :description , presence: true 
  validates :department_id , presence: true
  validates_uniqueness_of :name
end
