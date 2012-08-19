class ChangeColumnAvgFreq < ActiveRecord::Migration
  def up
    change_column :audiences, :avg_freq, :decimal, :precision => 8, :scale => 2
  end

  def down
  end
end
