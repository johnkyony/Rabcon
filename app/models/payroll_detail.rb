class PayrollDetail < ActiveRecord::Base
  belongs_to :user
  enum basis_wages_paid: [:hourly, :biweekly , :salary]
  validates :employees_work_week_start , presence: true
  validates :work_week_hours , presence: true 
  validates :basis_wages_paid , presence: true
  validates :regular_hourly_payrate , presence: true
  validates :daily_or_weekly_straight_time , presence: true
  validates :user_id , presence: true 
  after_initialize :set_basis_wages_paid, :if => :new_record?
  validates_uniqueness_of :user_id
  
   def set_basis_wages_paid
    self.basis_wages_paid ||= :hourly
  end
end
