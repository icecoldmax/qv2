class RemoveAuthorFromQuizzes < ActiveRecord::Migration
  def change
    remove_column :quizzes, :author
  end
end
