class SubastaController < ApplicationController
    # GET /users/1/producto/1/compras
  def index
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subastas = Subastum.all
      @users = User.all
    end
        
      # GET /users/1/producto/1/compras/1
  def show
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = Subastum.find(params[:id])
  end
        
      # GET /users/1/producto/1/compras/new
  def new
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = @compra.subasta.new
  end
        
      # POST /users/1/producto/1/compras/new
  def create
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = @compra.subasta.new(subasta_params)
      @subasta.producto = @producto
      @subasta.user = @user
    
      if @subasta.save
          # Si se guarda, redirigimos a user/:id
        redirect_to subastum_url(@user, @producto, @compra, @subasta)
      else
          # que se teje?
        render :new, status: :unprocessable_entity
      end
  end
        
          # GET /users/1/producto/1/compras/1/edit
  def edit
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = @compra.subasta.find(params[:id])
  end
        
      # PATCH /users/1/producto/1/compras/1/edit
  def update
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = @compra.subasta.find(params[:id])
    
      if @subasta.update(subasta_params)
          # Si cambia, redirigimos a user/:id/compra/:id
        redirect_to subastum_url(@user, @producto, @compra, @subasta)
      else
          # Que se teje?
        render :edit, status: :unprocessable_entity
      end
  end
        
      # DELETE /users/1/producto/1/compras/1
  def destroy
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = @compra.subasta.find(params[:id])
      @subasta.destroy
    
      redirect_to ver_subastums_url(@user, @producto, @compra), status: :see_other
  end
        
      private
  def subasta_params
    params.require(:subastum).permit(:base, :estado)
  end
end
