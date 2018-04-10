class AddRegularTimeToDailyPayment < ActiveRecord::Migration
  def change
    add_column :daily_payments, :regular_hours, :float
    add_column :daily_payments, :overtime_hours, :float
  end
end
