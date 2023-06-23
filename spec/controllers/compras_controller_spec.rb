require 'rails_helper'

RSpec.describe ComprasController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
      @producto = FactoryBot.create(:producto, user: @user)
      @compra = FactoryBot.create(:compra, producto: @producto, user: @user)
      # @subastum = FactoryBot.create(:subastum, user: @user, producto: @producto, compra: @compra )
      # @ofertum = FactoryBot.create(:ofertum, user: 
      #@user, producto: @producto, compra: @compra.id, subasta: @subastum )
  end

    describe "GET #index" do
      it "renders the :index template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          get :index, params: { user_id: @user.id, producto_id: @producto.id}
          expect(response).to render_template(:index)
      end
    end

    describe "GET #show" do
      it "renders the :show template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          allow(Compra).to receive(:find).and_return(@compra)
          get :show, params: { user_id: @user.id, producto_id: @producto.id, id: @compra.id}
          expect(response).to render_template(:show)
      end
    end

    describe "GET #new" do
      it "renders the :new template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          allow(Compra).to receive(:find).and_return(@compra)
          get :new, params: { user_id: @user.id, producto_id: @producto.id, id: @compra.id}
          expect(response).to render_template(:new)
      end
    end
    describe "GET #edit" do
      it "renders the :edit template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          allow(Compra).to receive(:find).and_return(@compra)
          get :edit, params: { user_id: @user.id, producto_id: @producto.id, id: @compra.id}
          expect(response).to render_template(:edit)
      end
    end

    describe "DELETE destroy" do

      it "destroys the compra" do
          # let(:valid_params) { { user_id: @user.id, producto_id: @producto.id, 
          # subasta_id: @subastum.id, oferta_id: @ofertum.id, compra: {valor: 150, 
          # descripcion: "zapatilla blanca", id: 1, estado: "Aprobada"} } }
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          allow(Compra).to receive(:find).and_return(@compra)
          expect(@compra).to receive(:destroy)
          delete :destroy, params: { user_id: @user.id, producto_id: @producto.id, id: @compra.id,}
          @compra.destroy
      end
    end

    describe "POST #create" do
      context "with valid parameters" do
        let(:valid_params) {
 { user_id: @user.id, producto_id: @producto.id, 
compra: {valor: 150, descripcion: "zapatilla blanca", id: 1, estado: "Aprobada"} } }
  
          it "assigns the created compra to @compra" do
            post :create, params: valid_params
              expect(assigns(:compra)).to be_a(Compra)
              expect(assigns(:compra)).to be_persisted
              expect(response).to redirect_to(compra_url(@user, @producto, assigns(:compra)))
          end
      end
    
        context "with invalid parameters" do
          let(:invalid_params) {
 { user_id: @user.id, producto_id: @producto.id, 
compra: {valor: nil, descripcion: "zapatilla blanca", id: 1, estado: "Aprobada"} } }
        
            it "re-renders the :edit template" do
              post :create, params: invalid_params
                get :edit, params: { user_id: @user.id, producto_id: @producto.id, id: @compra.id}
                expect(response).to render_template(:edit)
            end
        
            it "returns unprocessable entity status" do
              post :create, params: invalid_params
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
end