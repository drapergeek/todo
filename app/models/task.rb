class Task < ActiveRecord::Base
  attr_accessible :name, :due_at
  validates :name, presence: true
  
  scope :complete, where(:completed => true)
  scope :incomplete, where(:completed => false)
  scope :newest_first, order("created_at DESC")
  scope :completed_first, order("completed DESC")
 
  def due_date
    if due_at
      "Due: #{due_at}"
    else
      nil
    end
  end
end