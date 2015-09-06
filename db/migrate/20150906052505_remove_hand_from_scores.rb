class RemoveHandFromScores < ActiveRecord::Migration
  def change
    remove_column :scores, :hands_id, :integer
  end
end
