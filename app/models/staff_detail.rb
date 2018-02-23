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
