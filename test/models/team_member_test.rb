# == Schema Information
#
# Table name: team_members
#
#  id          :integer          not null, primary key
#  team_id     :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :integer
#

require "test_helper"

describe TeamMember do
  let(:team_member) { TeamMember.new }

  it "must be valid" do
    value(team_member).must_be :valid?
  end
end
