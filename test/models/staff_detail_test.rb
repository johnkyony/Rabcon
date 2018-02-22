require "test_helper"

describe StaffDetail do
  let(:staff_detail) { StaffDetail.new }

  it "must be valid" do
    value(staff_detail).must_be :valid?
  end
end
