class UsersController < ApplicationController
  before_filter :find_user, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @users = User.all
    respond_with(@users)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.now[:success] = "User created"
      redirect_to users_path
    else
      flash.now[:danger] = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "User updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
