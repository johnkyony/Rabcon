class TeamMember < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  validates_uniqueness_of :user
end
