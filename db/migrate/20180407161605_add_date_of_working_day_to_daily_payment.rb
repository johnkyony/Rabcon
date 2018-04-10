class AddDateOfWorkingDayToDailyPayment < ActiveRecord::Migration
  def change
    add_column :daily_payments, :date_of_working_day, :date
  end
end
