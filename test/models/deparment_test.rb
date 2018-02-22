require "test_helper"

describe Deparment do
  let(:deparment) { Deparment.new }

  it "must be valid" do
    value(deparment).must_be :valid?
  end
end
