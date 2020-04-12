class TableScoreboard < ActiveRecord::Migration[6.0]
  def change
    create_table :scoreboards do |t|
      t.integer :user_id,   :null => false
      t.integer :quizz_id,  :null => false
      t.integer :score,     :null => false

      t.timestamps
    end
  end
end