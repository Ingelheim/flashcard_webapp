class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :round
      t.references :card
      t.boolean :correct?

      t.timestamps
    end
  end
end
