class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :Decks
      t.integer :deck_id
      t.integer :multiverse_id

      t.timestamps
    end
  end
end
