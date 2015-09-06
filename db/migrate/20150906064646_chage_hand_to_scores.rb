class ChageHandToScores < ActiveRecord::Migration
  def change
    add_column :scores, :user_id, :integer
    remove_column :scores, :name, :string
  end
end
