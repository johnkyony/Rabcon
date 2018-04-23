# == Schema Information
#
# Table name: employees
#
#  id                    :integer          not null, primary key
#  full_name             :string
#  address               :string
#  birthdate             :datetime
#  id_or_passport_number :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require "test_helper"

describe Employee do
  let(:employee) { Employee.new }

  it "must be valid" do
    value(employee).must_be :valid?
  end
end
