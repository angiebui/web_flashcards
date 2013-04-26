class DecksRoundsCards < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :category
    end

    create_table :rounds do |t|
      t.integer :score
      t.integer :user_id
      t.integer :deck_id
    end

    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.integer :deck_id
    end
  end
end
