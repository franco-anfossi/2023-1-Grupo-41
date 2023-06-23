require 'rails_helper'

RSpec.describe OfertaController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
      @producto = FactoryBot.create(:producto, user: @user)
      @compra = FactoryBot.create(:compra, producto: @producto, user: @user)
      @subasta = FactoryBot.create(:subastum, user: @user, producto: @producto, compra: @compra )
      @oferta = FactoryBot.create(:ofertum, user: @user, producto: @producto, compra: @compra, subastum: @subasta )
  end

    describe "GET #index" do
      before do
        get :index, params: {
        user_id: @user.id,
        producto_id: @producto.id,
        compra_id: @compra.id,
        subastums_id: @subasta.id
        }
      end
    
        it "assigns corrects" do
          expect(assigns(:user)).to eq(@user)
            expect(assigns(:producto)).to eq(@producto)
            expect(assigns(:compra)).to eq(@compra)
            expect(assigns(:subasta)).to eq(@subasta)
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
      before do
        get :show, 
            params: {user_id: @user.id, producto_id: @producto.id, compra_id: @compra.id, subastums_id: @subasta.id, 
id: @oferta.id}
      end
    
        it "assigns corrects" do
          expect(assigns(:user)).to eq(@user)
            expect(assigns(:producto)).to eq(@producto)
            expect(assigns(:compra)).to eq(@compra)
            expect(assigns(:subasta)).to eq(@subasta)
            expect(assigns(:oferta)).to eq(@oferta)
            expect(response).to render_template(:show)
        end
    end
    describe "GET #new" do
      before do
        get :new, 
            params: {user_id: @user.id, producto_id: @producto.id, compra_id: @compra.id,subastums_id: @subasta.id}
      end
    
        it "assigns corrects" do
          expect(assigns(:user)).to eq(@user)
            expect(assigns(:producto)).to eq(@producto)
            expect(assigns(:compra)).to eq(@compra)
            expect(assigns(:subasta)).to eq(@subasta)
            expect(assigns(:oferta)).to be_a_new(Ofertum)
            expect(response).to render_template(:new)
        end
    end

    describe "GET #edit" do
      before do
        get :edit, 
            params: {user_id: @user.id, producto_id: @producto.id, compra_id: @compra.id, subastums_id: @subasta.id, 
id: @oferta.id}
      end
        it "assigns corrects" do
          expect(assigns(:user)).to eq(@user)
            expect(assigns(:producto)).to eq(@producto)
            expect(assigns(:compra)).to eq(@compra)
            expect(assigns(:subasta)).to eq(@subasta)
            expect(assigns(:oferta)).to eq(@oferta)
            expect(response).to render_template(:edit)
        end
    end
end