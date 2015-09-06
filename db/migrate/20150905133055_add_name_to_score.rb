class AddNameToScore < ActiveRecord::Migration
  def change
    add_column :scores, :score, :integer
    add_column :scores, :name, :string
  end
end
