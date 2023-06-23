class ComprasController < ApplicationController
  # GET /users/1/producto/1/compras
  def index
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @compras = Compra.all
  end

  # GET /users/1/producto/1/compras/1
  def show
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @compra = @producto.compras.find(params[:id]) 
  end

  # GET /users/1/producto/1/compras/new
  def new
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @compra = @producto.compras.new
  end

  # POST /users/1/producto/1/compras/new
  def create
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @compra = @producto.compras.new(compra_params)
    @compra.user = @user

    if @compra.save
      # Si se guarda, redirigimos a user/:id
      redirect_to compra_url(@user, @producto, @compra)
    else
      # que se teje?
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/1/producto/1/compras/1/edit
  def edit
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @compra = @producto.compras.find(params[:id])
  end

  # PATCH /users/1/producto/1/compras/1/edit
  def update
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @compra = @producto.compras.find(params[:id])

    if @compra.update(compra_params)
      # Si cambia, redirigimos a user/:id/compra/:id
      redirect_to compra_url(@user, @producto, @compra)
    else
      # Que se teje?
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1/producto/1/compras/1
  def destroy
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @compra = @producto.compras.find(params[:id])
    @compra.destroy

    redirect_to ver_compras_url(@user, @producto), status: :see_other
  end

  private
  def compra_params
    params.require(:compra).permit(:valor, :descripcion, :estado)
  end
end
