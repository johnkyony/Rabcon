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

require "test_helper"

describe ClockIn do
  let(:clock_in) { ClockIn.new }

  it "must be valid" do
    value(clock_in).must_be :valid?
  end
end
