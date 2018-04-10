# == Schema Information
#
# Table name: daily_payments
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  clock_in_id         :integer
#  clock_out_id        :integer
#  amount              :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  regular_hours       :float
#  overtime_hours      :float
#  date_of_working_day :date
#

require "test_helper"

describe DailyPayment do
  let(:daily_payment) { DailyPayment.new }

  it "must be valid" do
    value(daily_payment).must_be :valid?
  end
end
