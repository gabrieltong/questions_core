class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :score
      t.string :num
      t.string :state
      t.text :description
      t.string :answer
      t.text :choices
      t.text :extra
      t.timestamps
    end

    add_index :questions,:score
    add_index :questions,:num
    add_index :questions,:state
    add_index :questions,:answer
  end
end
