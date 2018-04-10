# == Schema Information
#
# Table name: clock_outs
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  team_leader_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  time_clocked_out :datetime
#

class ClockOut < ActiveRecord::Base
  belongs_to :user
  belongs_to :team_leader
  has_many :daily_payment
end
