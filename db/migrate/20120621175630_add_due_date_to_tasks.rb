class AddDueDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :due_at, :timestamp
  end
end
