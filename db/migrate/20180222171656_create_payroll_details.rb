class CreatePayrollDetails < ActiveRecord::Migration
  def change
    create_table :payroll_details do |t|
      t.datetime :employees_work_week_start
      t.time :work_week_hours
      t.integer :basis_wages_paid
      t.time :regular_hourly_payrate
      t.time :daily_or_weekly_straight_time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
