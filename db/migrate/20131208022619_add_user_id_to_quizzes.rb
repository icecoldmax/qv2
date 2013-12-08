class AddUserIdToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :user_id, :integer
    add_index :quizzes, :user_id
  end
end
