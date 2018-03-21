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

require "test_helper"

describe TeamLeader do
  let(:team_leader) { TeamLeader.new }

  it "must be valid" do
    value(team_leader).must_be :valid?
  end
end
