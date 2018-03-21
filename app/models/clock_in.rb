# == Schema Information
#
# Table name: clock_ins
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  team_leader_id  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  time_clocked_in :datetime
#

class ClockIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :team_leader
end
