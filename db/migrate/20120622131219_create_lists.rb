class CreateLists < ActiveRecord::Migration
  def up
    create_table :lists do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    
    add_column :tasks, :list_id, :integer
    
    Task.reset_column_information
    inbox = List.create(:name => "Inbox")
    Task.all.each do |task|
      task.list_id = inbox.id
      task.save
    end
  end
  
  def down
    remove_column :tasks, :list_id
    drop_table :lists
  end
end
