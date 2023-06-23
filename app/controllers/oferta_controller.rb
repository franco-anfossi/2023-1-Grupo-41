class OfertaController < ApplicationController
        # GET /users/1/producto/1/compras
  def index
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = Subastum.find(params[:subastums_id])
      @ofertas = Ofertum.all
    
      @users = User.all
  end
            
        # GET /users/1/producto/1/compras/1
  def show
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = Subastum.find(params[:subastums_id])
      @oferta = @subasta.oferta.find(params[:id])
  end
                
          # GET /users/1/producto/1/compras/new
  def new
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = Subastum.find(params[:subastums_id])
      @oferta = @subasta.oferta.new
  end
                
        # POST /users/1/producto/1/compras/new
  def create
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = Subastum.find(params[:subastums_id])
      @oferta = @subasta.oferta.new(oferta_params)
      @oferta.compra = @compra
      @oferta.producto = @producto
      @oferta.user = @user
          
      if @oferta.save
          # Si se guarda, redirigimos a user/:id
        redirect_to ofertum_url(@user, @producto, @compra, @subasta, @oferta)
      else
          # que se teje?
        puts @oferta.errors.full_messages
          render :new, status: :unprocessable_entity
      end
  end
                
        # GET /users/1/producto/1/compras/1/edit
  def edit
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = Subastum.find(params[:subastums_id])
      @oferta = @subasta.oferta.find(params[:id])
  end
                
        # PATCH /users/1/producto/1/compras/1/edit
  def update
    @user = User.find(params[:user_id])
      @producto = Producto.find(params[:producto_id])
      @compra = Compra.find(params[:compra_id])
      @subasta = Subastum.find(params[:subastums_id])
      @oferta = @subasta.oferta.find(params[:id])
          
      if @oferta.update(oferta_params)
          # Si cambia, redirigimos a user/:id/compra/:id
        redirect_to ofertum_url(@user, @producto, @compra, @subasta, @oferta)
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
          @subasta = Subastum.find(params[:subastums_id])
          @oferta = @subasta.ofertums.find(params[:id])
          @oferta.destroy
          
      redirect_to ver_ofertums_url(@user, @producto, @compra, @subasta), status: :see_other
  end
                
        private
  def oferta_params
    params.require(:ofertum).permit(:monto, :estado, :ofertor)
  end
end
