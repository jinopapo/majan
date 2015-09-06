class AddHandToScores < ActiveRecord::Migration
  def change
    add_column :scores, :hand_id, :integer
  end
end
