class CreateQuizAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :quiz_answers do |t|
      t.string :quiz_option
      t.boolean :is_answer
      t.datetime :discarded_at
      t.references :quiz_questions, null: false, foreign_key: true

      t.timestamps
    end
  end
end
