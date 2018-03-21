class AddTimeClockedInToClockIns < ActiveRecord::Migration
  def change
    add_column :clock_ins, :time_clocked_in, :datetime
  end
end
