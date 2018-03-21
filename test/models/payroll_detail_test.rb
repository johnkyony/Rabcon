# == Schema Information
#
# Table name: payroll_details
#
#  id                            :integer          not null, primary key
#  employees_work_week_start     :string
#  work_week_hours               :integer
#  basis_wages_paid              :integer
#  regular_hourly_payrate        :float
#  daily_or_weekly_straight_time :integer
#  user_id                       :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require "test_helper"

describe PayrollDetail do
  let(:payroll_detail) { PayrollDetail.new }

  it "must be valid" do
    value(payroll_detail).must_be :valid?
  end
end
