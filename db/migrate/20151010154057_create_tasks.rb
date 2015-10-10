class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :assigned_user_id
      t.integer :tokens

      t.timestamps null: false
    end
  end
end
