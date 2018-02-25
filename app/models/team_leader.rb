class TeamLeader < ActiveRecord::Base
  belongs_to :team
  belongs_to :team_member
  
end
