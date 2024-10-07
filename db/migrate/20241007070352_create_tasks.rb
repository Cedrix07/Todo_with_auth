class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name 
      t.string :decription 
      t.date :due_date 
      t.timestamps
    end
  end
end
