class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :question
      t.string :answer
      t.belongs_to :deck
      
      t.timestamps
    end
  end
end
