class ProductosController < ApplicationController
  # GET /users/1/productos
  def index
    @user = User.find(params[:user_id])
    @productos = Producto.all
    # Por defecto, visualiza la vista index.html.erb
  end

  # GET /users/1/productos/1
  def show
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:id])
    # Por defecto, visualiza la vista show.html.erb
  end

  # GET /users/1/productos/new
  def new
    @user = User.find(params[:user_id])
    @producto = @user.productos.new
  end

  # POST /users/1/productos/new
  def create
    @user = User.find(params[:user_id])
    @producto = @user.productos.new(producto_params)

    if @producto.save
      # Si se guarda, redirigimos a /:id
      redirect_to producto_url(@user, @producto)
    else
      # Mostramos new.html.erb con el codigo de error
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/1/productos/1/edit
  def edit
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:id])
  end

  # PATCH /users/1/productos/1/edit
  def update
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:id])
    if @producto.update(producto_params)
      # Si se actualiza, redirigimos a /:id
      redirect_to producto_url(@user, @producto)
    else
      # Mostramos edit.html.erd con el codigo de error
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1/productos/1
  def destroy
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:id])
    @producto.destroy
    
    redirect_to ver_productos_url(@user), status: :see_other
  end

  private
  def producto_params
    params.require(:producto).permit(:name, :imagen, :talla, :precio, :color)
  end
end
