class CreateHangouts < ActiveRecord::Migration[6.0]
  def change
    create_table :hangouts do |t|
      t.string :location
      t.integer :duration

      t.timestamps
    end
  end
end
