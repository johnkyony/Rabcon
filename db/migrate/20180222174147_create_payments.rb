class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :total_overtime_earning_for_work_week
      t.float :wages_amount
      t.date :date_of_payment
      t.date :pay_period
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
