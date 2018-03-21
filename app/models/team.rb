# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  name          :string
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string
#

class Team < ActiveRecord::Base
  belongs_to :deparment
  has_many :team_members
  has_many :team_leaders
  validates :name , presence: true
  validates :description , presence: true 
  validates :department_id , presence: true
  validates_uniqueness_of :name
end
