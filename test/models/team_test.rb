# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  name          :string
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string
#

require "test_helper"

describe Team do
  let(:team) { Team.new }

  it "must be valid" do
    value(team).must_be :valid?
  end
end
