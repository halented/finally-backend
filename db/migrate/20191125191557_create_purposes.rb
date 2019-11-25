class CreatePurposes < ActiveRecord::Migration[6.0]
  def change
    create_table :purposes do |t|
      t.string :title
      t.string :equipment
      t.integer :intensity

      t.timestamps
    end
  end
end
