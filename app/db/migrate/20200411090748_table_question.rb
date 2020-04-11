class TableQuestion < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :name,        :null => false
      t.text   :good_answer, :null => false
      t.text   :bad_answer1, :null => false
      t.text   :bad_answer2
      t.text   :bad_answer3

      t.timestamps
    end
  end
end