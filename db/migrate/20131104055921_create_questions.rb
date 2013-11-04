class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.string :content
      t.integer :quiz_id

      t.timestamps
    end

    add_index :questions, :quiz_id
  end

  def down
    drop_table :questions
  end
end
