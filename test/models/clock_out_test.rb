require "test_helper"

describe ClockOut do
  let(:clock_out) { ClockOut.new }

  it "must be valid" do
    value(clock_out).must_be :valid?
  end
end
