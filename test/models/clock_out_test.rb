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

require "test_helper"

describe ClockOut do
  let(:clock_out) { ClockOut.new }

  it "must be valid" do
    value(clock_out).must_be :valid?
  end
end
