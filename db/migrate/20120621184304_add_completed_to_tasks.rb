class AddCompletedToTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :completed, :boolean, default: false
    Task.reset_column_information
    Task.all.each do |task|
      task.update_attribute(:completed, false)
    end
  end
  
  def down
    remove_column :tasks, :completed
  end
end
