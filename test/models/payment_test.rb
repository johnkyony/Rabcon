# == Schema Information
#
# Table name: payments
#
#  id                                   :integer          not null, primary key
#  total_overtime_earning_for_work_week :float
#  wages_amount                         :float
#  date_of_payment                      :date
#  pay_period                           :date
#  user_id                              :integer
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#

require "test_helper"

describe Payment do
  let(:payment) { Payment.new }

  it "must be valid" do
    value(payment).must_be :valid?
  end
end
