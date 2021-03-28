class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show,:edit,:update]}
  before_action :forbid_login_user,{only: [:new,:create,:login_form,:login]}
  before_action :ensure_correct_user, {only: [:edit,:update]}
  before_action :set_user, {only: [:show,:edit,:update]}
  
  def show
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(name: params[:name],password: params[:password],password_confirmation: [:password_confirmation])
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]="ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
  end

  def update
    @user.name=params[:name]
    if @user.save
      flash[:notice]="ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")      
    else
      render("users/edit")
    end
  end

  def login_form

  end

  def login
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message="ユーザー名またはパスワードが間違っています"
      @name=params[:name]
      @password=params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/records/index")
    end
  end

  def set_user
    @user=User.find_by(id: params[:id])
  end
end
