class AddTimeClockedOutToClockOuts < ActiveRecord::Migration
  def change
    add_column :clock_outs, :time_clocked_out, :datetime
  end
end
