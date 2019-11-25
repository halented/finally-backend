class CreateIntroverts < ActiveRecord::Migration[6.0]
  def change
    create_table :introverts do |t|
      t.string :name
      t.string :activity
      t.boolean :on_cooldown

      t.timestamps
    end
  end
end
