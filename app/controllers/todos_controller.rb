class TodosController < ApplicationController
  # def index
  #   render "index"
  # end

  # # RESOURCE
  # # Todo is a resource.
  # # - list of resources can be seen: index
  # # - single resource can be seen: show
  # # - create a new resource
  # def show
  #   id = params[:id]
  #   # render plain: "The id you wanted was #{id}"
  #   todo = Todo.find(id)
  #   render plain: todo.to_pleasant_string
  # end

  def basic
    # render plain: "Hello, this is /todos!"
    # render plain: Todo.all.map { |todo| todo.to_pleasant_string }.join("\n")
    render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.
             join("\n")
  end

  def manager
    render "index"
  end

  def managerShow
    render "todo"
  end

  def managerCreate
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    # response_text = "Hey, your new todo is created with the id #{new_todo.id}"
    # render plain: response_text
    redirect_to todo_manager_path
  end
end
