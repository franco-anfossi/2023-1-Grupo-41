class MensajesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:chat_id])
    @mensajes = @chat.mensajes.all

    # Esto se realiza para enviar a html y json
    # https://stackoverflow.com/questions/9492362/rails-how-does-the-respond-to-block-work
    respond_to do |format|
      format.html
      format.json { render json: @mensajes }
    end
  end
    
  def show
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:chat_id])
    @mensaje = @chat.mensajes.find(params[:id])
  end
    
  def new
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:chat_id])
    @mensaje = @chat.mensajes.new
    @mensaje.emisor = current_user.id
  end
    
  def create
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:chat_id])
    @mensaje = @chat.mensajes.new(mensaje_params)
    @mensaje.user = @user
    @mensaje.emisor = current_user.id

    if @mensaje.save
      redirect_to mensaje_url(@user, @chat, @mensaje)
    else
      render :new, status: :unprocessable_entity
    end
  end
    
  def edit
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:chat_id])
    @mensaje = @chat.mensajes.find(params[:id])
  end
    
  def update
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:chat_id])
    @mensaje = @chat.mensajes.find(params[:id])

    if @mensaje.update(mensaje_params)
      redirect_to mensaje_url(@user, @chat, @mensaje)
    else
      render :edit, status: :unprocessable_entity
    end
  end
    
  def destroy
    @user = User.find(params[:user_id])
    @chat = @user.chats.find(params[:chat_id])
    @mensaje = @chat.mensajes.find(params[:id])
    @mensaje.destroy

    redirect_to :ver_mensajes, status: :see_other
  end
    
    private
  def mensaje_params
    params.require(:mensaje).permit(:contenido, :nombre, :emisor)
  end
end
