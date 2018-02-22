require "test_helper"

describe TeamLeader do
  let(:team_leader) { TeamLeader.new }

  it "must be valid" do
    value(team_leader).must_be :valid?
  end
end
