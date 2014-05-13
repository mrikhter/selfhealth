class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  skip_before_filter :authorize, :only => [:new, :create]

  def index
    if current_user.admin?
      # binding.pry
      @users = User.ordered
    else
      redirect_to welcome_path
    end
  end

  def new
    @user = User.new
  end

  def create
    u = user_params
    u["gender"] = u["gender"].to_i
    @user = User.new(u)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path, notice: 'Signed Up!'
    else
      render action: 'new'
    end
  end

  def update
    # binding.pry
    u = user_params
    u["gender"] = u["gender"].to_i
    if @user.update(u)
      redirect_to welcome_path, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private
    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :dob, :age, :zip, :gender, :password, :password_confirmation)
    end
end

