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

class StaffDetail < ActiveRecord::Base
  belongs_to :user
  validates :employee_full_name , presence: true
  validates :address , presence: true
  validates :birthdate , presence: true
  validates :id_or_passport_number , presence: true
  validates :employee_number , presence: true
  validates :user_id , presence: true
  
  validates_uniqueness_of :id_or_passport_number
  validates_uniqueness_of :user_id
end
