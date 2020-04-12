class TableQuizz < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzs do |t|
      t.string  :title,           :null => false
      t.integer :difficulty_id,    :null => false

      t.integer :question_1_id,   :null => false
      t.integer :question_2_id,
      t.integer :question_3_id

      t.timestamps
    end
  end
end
