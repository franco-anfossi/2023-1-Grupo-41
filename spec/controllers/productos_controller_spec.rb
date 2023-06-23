require 'rails_helper'

RSpec.describe ProductosController, type: :controller do

#  get "/users/:user_id/productos", to: "productos#index", as: "ver_productos"
  before do
    @user = FactoryBot.create(:user)
      @producto = FactoryBot.create(:producto, user: @user)
  end

    describe "GET #index" do   
      it "assigns @user" do
        get :index, params: { user_id: @user.id }
          expect(assigns(:user)).to eq(@user)
      end
    end  
    
    describe "DELETE destroy" do
      # it "finds the user" do
      #   expect(User).to receive(:find).with(@user.id.to_s).and_return(@user)
      #   delete :destroy, params: { user_id: @user.id, id: @producto.id }
      # end

      #   it "finds the producto" do
      #     expect(Producto).to receive(:find).with(@producto.id.to_s).and_return(@producto)
      #       delete :destroy, params: { user_id: @user.id, id: @producto.id }
      #   end

      it "destroys the producto" do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          expect(@producto).to receive(:destroy)
          delete :destroy, params: { user_id: @user.id, id: @producto.id }
      end
    end

    describe "GET #new" do
      it "finds the user" do
        expect(User).to receive(:find).with(@user.id.to_s).and_return(@user)
          get :new, params: { user_id: @user.id }
      end
    end

    describe "GET #edit" do
    
      it "renders the edit template" do
        allow(User).to receive(:find).and_return(@user)
        allow(Producto).to receive(:find).and_return(@producto)
        get :edit, params: { user_id: @user.id, id: @producto.id }
        expect(response).to render_template("edit")
      end
    end

    
#metodo show
    describe "GET #show" do
      it "renders the :show template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          get :show, params: { user_id: @user.id, id: @producto.id }
          expect(response).to render_template(:show)
      end
    end

    describe "POST #create" do
      context "with valid parameters" do
        let(:valid_params) {
 { user_id: @user.id, 
producto: {name: "pepe", talla: 45, precio: 100, color: "azul", 
imagen: Rack::Test::UploadedFile.new(Rails.root.join('spec','support','bob-esponja.png'),'image/png') } } }

          it "assigns the created producto to @producto" do
            post :create, params: valid_params
              expect(assigns(:producto)).to be_a(Producto)
              expect(assigns(:producto)).to be_persisted
              expect(response).to redirect_to(producto_url(@user, assigns(:producto)))
          end
      end

        # context "with invalid parameters" do
        #     let(:invalid_params) { { user_id: @user.id, producto: 
        # {name: "pepe", talla: 45, precio: 100, color: "azul", imagen: nil } } }
        #     it "re-renders the :new template with unprocessable_entity status" do
        #         post :create, params: invalid_params
        #         get :new, params:  invalid_params
        #         expect(response).to have_http_status(:unprocessable_entity)
        #         # expect(response).to render_template(:new)
        #     end
        #   end
        
        #     # it "returns unprocessable entity status" do
        #     #     post :create, params: invalid_params
        #     #     expect(response).to have_http_status(:unprocessable_entity)
        #     end
        # end
    end
end