class CreateQuizQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :quiz_questions do |t|
      t.string :title
      t.string :question
      t.datetime :discarded_at
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
