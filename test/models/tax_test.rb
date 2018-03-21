# == Schema Information
#
# Table name: taxes
#
#  id         :integer          not null, primary key
#  name       :string
#  amount     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Tax do
  let(:tax) { Tax.new }

  it "must be valid" do
    value(tax).must_be :valid?
  end
end
