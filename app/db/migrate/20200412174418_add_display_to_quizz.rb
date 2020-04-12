class AddDisplayToQuizz < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzs, :display, :boolean, :default => false
  end
end
