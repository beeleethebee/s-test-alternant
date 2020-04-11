class TableDifficulty < ActiveRecord::Migration[6.0]
  def change
    create_table :difficulties do |t|
      t.string  :name,   :null => false
      t.integer :points, :default => 0

      t.timestamps
    end
  end
end