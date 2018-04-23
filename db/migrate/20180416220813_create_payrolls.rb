class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :employees_work_week_start
      t.integer :work_week_hours
      t.float :regular_hourly_payrate
      t.integer :daily_or_weekly_straight_time

      t.timestamps null: false
    end
  end
end
