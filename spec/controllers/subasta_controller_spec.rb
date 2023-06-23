require 'rails_helper'

RSpec.describe SubastaController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
      @producto = FactoryBot.create(:producto, user: @user)
      @compra = FactoryBot.create(:compra, producto: @producto, user: @user)
      @subasta = FactoryBot.create(:subastum, user: @user, producto: @producto, compra: @compra )
      @oferta = FactoryBot.create(:ofertum, user: @user, producto: @producto, compra: @compra, subastum: @subasta )
  end

    describe "GET #index" do
      before do
        get :index, params: {user_id: @user.id, producto_id: @producto.id, compra_id: @compra.id,}
      end

        it "assigns corrects" do
          expect(assigns(:user)).to eq(@user)
            expect(assigns(:producto)).to eq(@producto)
            expect(assigns(:compra)).to eq(@compra)
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
      before do
        get :show, params: {user_id: @user.id, producto_id: @producto.id, compra_id: @compra.id, id: @subasta.id}
      end
    
        it "assigns corrects" do
          expect(assigns(:user)).to eq(@user)
            expect(assigns(:producto)).to eq(@producto)
            expect(assigns(:compra)).to eq(@compra)
            expect(assigns(:subasta)).to eq(@subasta)
            expect(response).to render_template(:show)
        end
    end

    describe "GET #new" do
      before do
        allow(User).to receive(:find).and_return(@user)
          allow(Producto).to receive(:find).and_return(@producto)
          allow(Compra).to receive(:find).and_return(@compra)
          allow(@compra).to receive_message_chain(:subasta, :new).and_return(Subastum.new)
          get :new, params: {user_id: @user.id, producto_id: @producto.id, compra_id: @compra.id}
      end

        it "assigns all correct" do
          expect(assigns(:user)).to eq(@user)
            expect(assigns(:producto)).to eq(@producto)
            expect(assigns(:compra)).to eq(@compra)
            expect(assigns(:subasta)).to be_a_new(Subastum)
            expect(response).to render_template(:new)
        end
    end

    describe "GET edit" do
         
      before do
        allow(User).to receive(:find).with(@user.id.to_s).and_return(@user)
          allow(Producto).to receive(:find).with(@producto.id.to_s).and_return(@producto)
          allow(Compra).to receive(:find).with(@compra.id.to_s).and_return(@compra)
          allow(@compra).to receive_message_chain(:subasta, :find).with(@subasta.id.to_s).and_return(@subasta)
          get :edit, params: { user_id: @user.id, producto_id: @producto.id, compra_id: @compra.id, id: @subasta.id }
      end
  
        it 'assigns all correct' do
          expect(assigns(:user)).to eq(@user)
            expect(assigns(:producto)).to eq(@producto)
            expect(assigns(:compra)).to eq(@compra)
            expect(assigns(:subasta)).to eq(@subasta)
            expect(response).to render_template(:edit)
        end
    end
end