class AddRankToScores < ActiveRecord::Migration
  def change
    add_column :scores, :rank, :int
  end
end
