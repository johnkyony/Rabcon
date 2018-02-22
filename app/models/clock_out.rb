class ClockOut < ActiveRecord::Base
  belongs_to :user
  belongs_to :team_leader
end
