class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.string :content
      t.integer :question_id
      t.boolean :correct

      t.timestamps
    end

    add_index :answers, :question_id
  end

  def down
    drop_table :answers
  end
end
