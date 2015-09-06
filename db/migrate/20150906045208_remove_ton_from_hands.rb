class RemoveTonFromHands < ActiveRecord::Migration
  def change
    remove_column :hands, :ton_id, :integer
    remove_column :hands, :nan_id, :integer
    remove_column :hands, :sha_id, :integer
    remove_column :hands, :pei_id, :integer
  end
end
