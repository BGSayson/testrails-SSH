class UsersController < ApplicationController
  require "bcrypt"
  def index # GET /users
    @users = User.all
  end

  def show # GET /users/:id # displays a specific article
    @user = User.find(params[:id])
  end

  def new # GET /articles/new #get the form to fill up to create a new article
    @user = User.new
  end

  def create # POST /articles actually creates the article
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path # /articles
    else
      puts "kafka"
      render :new
    end
  end

  def edit # GET /articles/:id/edit ###gets the form to edit selected article
    @user = User.find(params[:id])
  end

  def update # PUT/PATCH /articles/:id # actually modify selected article
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(params[:id])
  end

  def delete # DELETE/POST /articles/:id # deletes selected article
    @user = User.find(params[:id])
    @user = User.delete(params[:id])
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
