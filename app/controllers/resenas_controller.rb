class ResenasController < ApplicationController
  # GET /users/:id_user/producto/1/resenas
  def index
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @resenas = Resena.all
  end

  # GET /users/:id_user/producto/1/resenas/1
  def show
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @resena = @producto.resenas.find(params[:id]) 
  end

  # GET /users/:id_user/productos/1/resena/new
  def new
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @resena = @producto.resenas.new
  end

  # POST /users/:id_user/productos/1
  def create
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @resena = @producto.resenas.new(resena_params)
    @resena.user = @user

    if @resena.save
      # Si se guarda, redirigimos a producto/:id
      redirect_to resena_url(@user, @producto, @resena)
    else
      # que se teje?
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/:id_user/productos/1/resenas/1/edit
  def edit
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @resena = @producto.resenas.find(params[:id])
  end

  # PATCH /users/:id_user/productos/1/resena/1
  def update
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @resena = @producto.resenas.find(params[:id])

    if @resena.update(resena_params)
        # Si cambia, redirigimos a producto/:id/resena/:id
      redirect_to resena_url(@user, @producto, @resena)
    else
        #Que se teje?
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id_user/productos/1/resena/1
  def destroy
    @user = User.find(params[:user_id])
    @producto = Producto.find(params[:producto_id])
    @resena = @producto.resenas.find(params[:id])
    @resena.destroy

    redirect_to ver_resenas_url(@user, @producto), status: :see_other
  end

  private
  def resena_params
    params.require(:resena).permit(:usuario, :contenido, :calificacion)
  end
end
