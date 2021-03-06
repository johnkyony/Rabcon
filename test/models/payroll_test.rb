# == Schema Information
#
# Table name: payrolls
#
#  id                            :integer          not null, primary key
#  employee_id                   :integer
#  employees_work_week_start     :string
#  work_week_hours               :integer
#  regular_hourly_payrate        :float
#  daily_or_weekly_straight_time :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require "test_helper"

describe Payroll do
  let(:payroll) { Payroll.new }

  it "must be valid" do
    value(payroll).must_be :valid?
  end
end
