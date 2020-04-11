class TableUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :login ,          :null => false, unique: true
      t.text    :password_digest, :null => false
      t.string  :role,            :default => nil
      t.integer :points,          :default => 0

      t.timestamps
    end
  end
end