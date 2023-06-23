class ChatsController < ApplicationController
  def index
    @users = User.all
      
    @user = User.find(params[:user_id])
    @chats = @user.chats.all
  end
    
  def show
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:id])
  end
    
  def new
    @user = User.find(params[:user_id])
    @chat = @user.chats.new
  end
    
  def create
    @user = User.find(params[:user_id])
    @chat = @user.chats.new(chat_params)

    if @chat.save
      redirect_to chat_url(@user, @chat)
    else
      render :new, status: :unprocessable_entity
    end
  end
    
  def edit
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:id])
  end
    
  def update
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:id])
  
    if @chat.update(chat_params)
      redirect_to @chat
    else
      render :edit, status: :unprocessable_entity
    end
  end
    
  def destroy
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:id])
    @chat.destroy
    redirect_to ver_chats_url(@user), status: :see_other
  end
    
  private
  def chat_params
    params.require(:chat).permit(:asunto)
  end
end
