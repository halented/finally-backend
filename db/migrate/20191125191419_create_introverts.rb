class CreateIntroverts < ActiveRecord::Migration[6.0]
  def change
    create_table :introverts do |t|
      t.string :name
      t.string :activity
      t.string :img_ref
      t.boolean :on_cooldown

      t.timestamps
    end
  end
end
