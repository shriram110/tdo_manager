class Todo < ActiveRecord::Base
  belongs_to :user

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id} . #{due_date.to_s(:long)} #{todo_text} #{is_completed} "
  end

  def self.overdue
    Todo.all.where("due_date < ? and not completed", Date.today)
  end

  def self.due_later
    Todo.all.where("due_date > ? ", Date.today)
  end

  def self.due_today
    Todo.all.where(due_date: Date.today)
  end

  def self.completed
    Todo.all.where(completed: true)
  end
end
