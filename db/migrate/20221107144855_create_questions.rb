class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :description
      t.string :correct_answer
      t.string :incorrect_answer, array: true, default: []
      t.references :user, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
