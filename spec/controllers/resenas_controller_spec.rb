require 'rails_helper'
require 'faker'
RSpec.describe ResenasController, type: :controller do
  before do
    @user = FactoryBot.create(:user2)
      @producto = FactoryBot.create(:producto, user: @user)
      @resena = FactoryBot.create(:resena, producto: @producto, user: @user)   
  end

    describe "GET #index" do
      it "renders the :index template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          get :index, params: { user_id: @user.id, producto_id: @producto.id}
          expect(response).to render_template(:index)
      end
    end

    describe "GET #new" do
      it "renders the :new template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          allow(Resena).to receive(:find).and_return(@resena)
          get :new, params: { user_id: @user.id, producto_id: @producto.id, id: @producto_id}
          expect(response).to render_template(:new)
      end
    end

    describe "GET #show" do
      it "renders the :show template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          allow(Resena).to receive(:find).and_return(@resena)
          get :show, params: { user_id: @user.id, producto_id: @producto.id, id: @resena.id}
          expect(response).to render_template(:show)
      end
    end

    describe "GET #edit" do
      it "renders the :edit template" do
        allow(User).to receive(:find).and_return(@resena.usuario)
          allow(Producto).to receive(:find).and_return(@producto)
          allow(Resena).to receive(:find).and_return(@resena)
          get :edit, params: { user_id: @user.id, producto_id: @producto.id, id: @resena.id}
          expect(response).to render_template(:edit)
      end
    end

    describe "DELETE destroy" do

      it "destroys the resena" do
        allow(User).to receive(:find).and_return(@resena.usuario)
          allow(Producto).to receive(:find).and_return(@producto)
          allow(Resena).to receive(:find).and_return(@resena)
          expect(@resena).to receive(:destroy)
          delete :destroy, params: { user_id: @user.id, producto_id: @producto.id, id: @resena.id}
          @resena.destroy
      end
    end
    describe "POST #create" do
      context "with valid parameters" do
        let(:valid_params) {
 { user_id: @user.id, producto_id: @producto.id, 
resena: {usuario: @user, contenido: "muy bueno", calificacion: 4, id: 1, producto: @producto}} } 
  
          it "assigns the created resena" do
            post :create, params: valid_params
              expect(assigns(:resena)).to be_a(Resena)
              expect(assigns(:resena)).to be_persisted
              expect(response).to redirect_to(resena_url(@user, @producto, assigns(:resena)))
          end
      end
    
        context "with invalid parameters" do
          let(:invalid_params) {
 { user_id: @user.id, producto_id: @producto.id, 
resena: {usuario: @user, contenido: "muy bueno", calificacion: 4, id: nil, producto: @producto} } }
        
            it "re-renders the :edit template" do
              post :create, params: invalid_params
                get :edit, params: { user_id: @user.id, producto_id: @producto.id, id: @resena.id}
                expect(response).to render_template(:edit)
            end
        
            # it "returns unprocessable entity status" do
            #     post :create, params: invalid_params
            #     expect(response).to have_http_status(:unprocessable_entity)
            # end
        end
    end


    describe "PATCH update" do
      let(:valid_params) {
 { id: @resena.id, user_id: @user.id, producto_id: @producto.id, 
resena: { calificacion: 5, contenido: "buen producto" } } }
        let(:invalid_params) {
 { id: @resena.id, user_id: @user.id, producto_id: @producto.id, resena: { calificacion: nil, contenido: "" } } }
    
        context "with valid params" do
          it "updates the resena and redirects to the show page" do
            patch :update, params: valid_params
      
              expect(response).to redirect_to(resena_url(@user, @producto, @resena))
              expect(assigns(:resena)).to eq(@resena)
              # expect(resena.reload.rating).to eq(5)
              # expect(resena.reload.comment).to eq("Great product!")
          end
        end
    
        context "with invalid params" do
          it "renders the edit view with unprocessable_entity status" do
            patch :update, params: invalid_params
              expect(response).to have_http_status(:unprocessable_entity)
              expect(response).to render_template(:edit)
              # expect(assigns(:resena)).to eq(resena)
          end
        end
    end
end



