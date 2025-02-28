class CreateWorlds < ActiveRecord::Migration[5.0]
  def change
    create_table :worlds do |t|
      t.integer :user_id
      t.integer :character_id
      t.string :name
      t.text :description
      t.string :image
      t.integer :public
      t.integer :max_character_count

      t.timestamps
    end
  end
end
