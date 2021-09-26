class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:logout, :show]}
  before_action :forbid_login_user, {only: [:new, :login_form, :login, :create]}
  before_action :ensure_correct_user, {only: [:edit]}
  
  def new
    @user = User.new
  end
  
  def login_form
    @user = User.new
  end
  
  def login
    @user = User.find_by(user_login_params)
    if @user
      flash[:notice] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render "users/login_form"
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_update_params)
      flash[:notice] = "ユーザーを編集しました"
      redirect_to(user_path)
    else
      render "edit"
    end
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    if @current_user.id != @user.id
        flash[:notice] = "他のユーザーです"
        redirect_to("/users/#{@user.id}")
    end
  end
  
  def create
    @user = User.new(user_create_params)
    if @user.save
      flash[:notice] = "ユーザーを新規登録しました"
      session[:user_id] = @user.id
      redirect_to("/")
    else
      render "new"
    end
  end
  
  private
  
    def user_create_params
      params.require(:user).permit(:name, :email, :password) 
    end
    
    def user_update_params
      params.require(:user).permit(:name, :email, :password, :introduction, :image) 
    end
    
    def user_login_params
      params.require(:user).permit(:email, :password)
    end

end
