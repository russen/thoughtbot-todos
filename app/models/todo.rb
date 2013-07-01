class Todo < ActiveRecord::Base

  def complete?
    completed_at?
  end

  def mark_complete
    touch :completed_at
  end

  def mark_incomplete
    update completed_at: nil
  end
end
