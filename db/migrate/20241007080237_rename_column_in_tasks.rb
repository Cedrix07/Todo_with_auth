class RenameColumnInTasks < ActiveRecord::Migration[5.1]
  def change
      rename_column :tasks, :decription, :description
  end
end
