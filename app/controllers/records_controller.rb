class RecordsController < ApplicationController
  before_action :authenticate_user
  before_action :set_record, {only: [:show,:edit,:update,:destroy,:ensure_correct_user]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @records = Record.all.recent
  end

  def show
    @user = @record.user
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(book_name: params[:book_name],user_id: @current_user.id)
    if @record.save
      flash[:notice]="積み本を追加しました"
      redirect_to("/records/index")
    else
      render("records/new")
    end
  end

  def edit
  end

  def update
    @record.book_name = params[:book_name] 
    if @record.save
      flash[:notice]="積み本を編集しました"
      redirect_to("/records/index")
    else
      render("records/edit")
    end
  end

  def destroy
    @record.destroy
    flash[:notice]="積み本を削除しました"
    redirect_to("/records/index")
  end

  def ensure_correct_user
    if @current_user.id != @record.user_id
      flash[:notice]="権限がありません"
      redirect_to("/records/index")
    end
  end

  def set_record
    @record = Record.find_by(id: params[:id])
  end
    
end
