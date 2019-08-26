class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]



  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  # def create
  #  user=User.find_by(email:params[:session][:email].downcase)
  #  if user & user.authenticate(params[:session][:password])
  #    log_in user
  #    remember user
  #    redirected_to user
  #  else
  #    flash.now[:danger] = "invalid email/password combination"
  #    render "new"
  # end

 def destroy
  log_out
  redirected_to root_url
 end

private

 def correct_user
  @user = User.find(params[:id])
  if @user != current_user
    redirect_to user_path(current_user)
  end

 end

 def user_params
      params.require(:user).permit(:profile_image, :name, :introduction)
 end
end