class TodosController < ApplicationController
  def index
    render plain: "hello this is /todos"
  end
end
