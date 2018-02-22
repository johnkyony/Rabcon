require "test_helper"

describe DailyPayment do
  let(:daily_payment) { DailyPayment.new }

  it "must be valid" do
    value(daily_payment).must_be :valid?
  end
end
