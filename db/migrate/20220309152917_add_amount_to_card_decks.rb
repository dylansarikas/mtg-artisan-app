class AddAmountToCardDecks < ActiveRecord::Migration[7.0]
  def change
    add_column :card_decks, :amount, :integer
  end
end
