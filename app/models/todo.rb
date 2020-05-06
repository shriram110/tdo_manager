class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :due_date, presence: true
  validates :todo_text, length: { minimum: 2 }

  belongs_to :user

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id} . #{due_date.to_s(:long)} #{todo_text} #{is_completed} "
  end

  def self.of_user(user)
    all.where(user_id: user.id)
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
