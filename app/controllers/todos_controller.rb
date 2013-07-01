class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = current_user.todos.where(owner_email: current_email)
  end

  def create
    current_user.todos.create(todo_params)
    redirect_to todos_path
  end

  private
  def todo_params
    params.require(:todo).permit(:title)
  end

end