class DailyPayment < ActiveRecord::Base
  belongs_to :user
  belongs_to :clock_in
  belongs_to :clock_out
end
