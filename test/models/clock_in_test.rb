require "test_helper"

describe ClockIn do
  let(:clock_in) { ClockIn.new }

  it "must be valid" do
    value(clock_in).must_be :valid?
  end
end
