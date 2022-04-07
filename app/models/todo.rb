class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date} #{todo_text} #{is_completed}"
  end

  def due_today?
    due_date.to_date == Date.today
  end

  def overdue?
    due_date.to_date < Date.today
  end

  def due_later?
    due_date.to_date > Date.today
  end

  def self.overdue
    Todo.all { |todo| todo.overdue? }
    # all.where("due_date.to_date < ?", Date.today)
  end

  def self.due_today
    Todo.all { |todo| todo.due_today? }
    # all.where("due_date.to_date == ?", Date.today)
  end

  def self.due_later
    Todo.all { |todo| todo.due_later? }
    # all.where("due_date.to_date > ?", Date.today)
  end

  def self.add_task(h)
    Todo.create!(
      todo_text: h[:todo_text],
      due_date: Date.today + h[:due_in_days],
      completed: false,
    )
  end

  def self.completed
    all.where(completed: true)
  end

  def self.mark_as_complete!(id)
    todo = find(id)
    todo.completed = true
    todo.save!
    todo
  end
end

#{due_date.to_s(:long)}
