class CreateClockOuts < ActiveRecord::Migration
  def change
    create_table :clock_outs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :team_leader, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
