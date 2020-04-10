class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render "index"
    #render plain: Todo.order(:id).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    render plain: "new todo created with id number #{new_todo.id}"
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "updated todo completed status of id #{id} to #{completed} "
  end
end
