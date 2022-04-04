class TodosController < ApplicationController
  def index
    # render plain: "Hello, this is /todos!"
    render plain: Todo.all.to_ary
  end
end
