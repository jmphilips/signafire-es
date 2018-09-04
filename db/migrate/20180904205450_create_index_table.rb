class CreateIndexTable < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.integer :user_record
      t.references :user, foreign_key: true
    end
  end
end
