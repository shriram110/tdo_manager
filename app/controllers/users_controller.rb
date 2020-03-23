class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    render plain: User.find(id).to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    render plain: "new user created with id number #{new_user.id}"
  end

  def login
    user = User.where("email=? and password=?", params[:email], params[:password])
    response_text = (user.length != 0) ? "True" : "False"
    render plain: response_text
  end
end
