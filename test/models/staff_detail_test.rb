# == Schema Information
#
# Table name: staff_details
#
#  id                    :integer          not null, primary key
#  employee_full_name    :string
#  address               :string
#  birthdate             :datetime
#  id_or_passport_number :string
#  employee_number       :string
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require "test_helper"

describe StaffDetail do
  let(:staff_detail) { StaffDetail.new }

  it "must be valid" do
    value(staff_detail).must_be :valid?
  end
end
