# == Schema Information
#
# Table name: team_leaders
#
#  id             :integer          not null, primary key
#  team_id        :integer
#  team_member_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TeamLeader < ActiveRecord::Base
  belongs_to :team
  belongs_to :team_member
  has_many :clock_in
  has_many :clock_out
  
end
