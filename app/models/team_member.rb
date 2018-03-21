# == Schema Information
#
# Table name: team_members
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeamMember < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  validates_uniqueness_of :user
end
