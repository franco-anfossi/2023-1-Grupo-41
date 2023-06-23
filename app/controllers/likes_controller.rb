class LikesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
      @likes = @user.likes.all
  end

  def create
    if already_liked?()
        # pass
    else
      @user = User.find(params[:user_id])
        @producto = Producto.find(params[:producto_id])
        @like = @producto.likes.new
        @like.user = @user

        if @like.save
          redirect_to producto_url(@user, @producto)
        else
          render ver_productos(@user, @producto), status: :unprocessable_entity
        end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
      @like = @user.likes.find(params[:id])
      @like.destroy

      redirect_to ver_likes_url(@user)
  end

    private
  def already_liked?
    Like.where(user_id: params[:user_id], producto_id: params[:producto_id]).exists?
  end
end
