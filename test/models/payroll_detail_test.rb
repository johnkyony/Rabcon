require "test_helper"

describe PayrollDetail do
  let(:payroll_detail) { PayrollDetail.new }

  it "must be valid" do
    value(payroll_detail).must_be :valid?
  end
end
