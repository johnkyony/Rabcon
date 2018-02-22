require "test_helper"

describe Tax do
  let(:tax) { Tax.new }

  it "must be valid" do
    value(tax).must_be :valid?
  end
end
