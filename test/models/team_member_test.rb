require "test_helper"

describe TeamMember do
  let(:team_member) { TeamMember.new }

  it "must be valid" do
    value(team_member).must_be :valid?
  end
end
