class UsersController < ApplicationController

  def index
    @users = User.all 
    render json: @users 
  end 

  def create 
    @user = User.new(username:params[:username], password:params[:password])
    if @user.valid?
      @user.save
      render json: {username: @user.username, token: issue_token({id:@user.id})}
      
    else
        render json: {error: "That username has been taken"}, status: 401
    end
  end 

  def signin
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        render json: {username: @user.username, token: issue_token({id:@user.id})}
    else 
        render json: {error: "Username/password combination invalid"}, status: 401
    end 
  end 

  def validate 
    @user = get_current_user 
    if @user 
        render json: {username: @user.username, token: issue_token({id:@user.id})}
    else 
        render json: {error: "Username/password combination invalid"}, status: 401
    end 
  end 

  def get_snippets 
    @user = get_current_user
    if @user 
        render json: @user.snippets 
    else 
        render json: {error: "Not a valid user"}, status: 401

    end 
  end 
end
