class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :ton_id
      t.integer :nan_id
      t.integer :sha_id
      t.integer :pei_id
      t.timestamps null: false
    end
  end
end
