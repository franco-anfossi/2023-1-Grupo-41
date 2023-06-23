require 'rails_helper'

RSpec.describe MensajesController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
      @chat = FactoryBot.create(:chat, user: @user)
      @mensaje = FactoryBot.create(:mensaje, chat: @chat, user: @user, emisor: @user.id)
  end

    describe "GET #index" do
      it "renders the :index template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Chat).to receive(:find).and_return(@chat)
          get :index, params: { user_id: @user.id, chat_id: @chat.id}
          expect(response).to render_template(:index)
      end
    end

    describe "GET #show" do
      it "renders the :show template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Chat).to receive(:find).and_return(@chat)
          allow(Mensaje).to receive(:find).and_return(@mensaje)
          get :show, params: { user_id: @user.id, chat_id: @chat.id, id: @mensaje.id}
          expect(response).to render_template(:show)
      end
    end

    # describe "GET #new" do
    #     it "renders the :new template" do
    #         allow(User).to receive(:find).and_return(@user)
    #         allow(Chat).to receive(:find).and_return(@chat)
    #         allow(Mensaje).to receive(:find).and_return(@mensaje)
    #         expect(assigns(:mensaje).emisor).to eq(@user.id)
    #         get :new, params: { user_id: @user.id, chat_id: @chat.id, id: @mensaje.id}
    #         expect(response).to render_template(:new)
    #     end
    # end

    describe "GET #edit" do
      it "renders the :show template" do
        allow(User).to receive(:find).and_return(@user)
          allow(Chat).to receive(:find).and_return(@chat)
          allow(Mensaje).to receive(:find).and_return(@mensaje)
          get :edit, params: { user_id: @user.id, chat_id: @chat.id, id: @mensaje.id}
          expect(response).to render_template(:edit)
      end
    end
    describe "DELETE destroy" do

      it "destroys the mensaje" do
        allow(User).to receive(:find).and_return(@user)
          allow(Chat).to receive(:find).and_return(@chat)
          allow(Mensaje).to receive(:find).and_return(@mensaje)
          expect(@mensaje).to receive(:destroy)
          delete :destroy, params: { user_id: @user.id, chat_id: @chat.id, id: @mensaje.id}
          @mensaje.destroy
      end
    end

    # describe "POST #create" do
    #     context "with valid parameters" do
    #         let(:valid_params) { { user_id: @user.id, chat_id: @chat.id, 
            # mensaje: {contenido: "Nuevo mensaje", nombre: "juan", emisor: @user.id, id: 3} } }
    
    #         it "assigns the created mensaje to @mensaje" do
    #             post :create, params: valid_params
    #             expect(assigns(:mensaje)).to be_a(Mensaje)
    #             expect(assigns(:mensaje)).to be_persisted
    #             expect(response).to redirect_to(mensaje_url(@user, @chat, assigns(:mensaje)))
    #         end
    #     end
    
    #     context "with invalid parameters" do
    #         let(:invalid_params) { { user_id: @user.id, chat_id: @chat.id, mensaje: 
    # {id: nil, contenido: "Nuevo mensaje", nombre: nil, emisor: nil} } }
        
    #         it "re-renders the :edit template" do
    #             post :create, params: invalid_params
    #             get :edit, params: { user_id: @user.id, chat_id: @chat.id, id: @mensaje.id}
    #             expect(response).to render_template(:edit)
    #         end
        
    #         it "returns unprocessable entity status" do
    #             post :create, params: invalid_params
    #             expect(response).to have_http_status(:unprocessable_entity)
    #         end
    #     end
    # end

    # describe "PATCH #update" do
    #     context "with valid parameters" do
    #         let(:valid_params) { { user_id: @user.id, chat_id: @chat.id, mensaje: 
    # {contenido: "Nuevo mensaje", nombre: "juan", id: 3} } }
    #         let(:parametros) {{mensajes: {contenido: "Nuevo mensaje", nombre: "juan"}}}
    #         it "renders the update template" do
    #             allow(User).to receive(:find).and_return(@user)
    #             allow(Chat).to receive(:find).and_return(@chat)
    #             allow(Mensaje).to receive(:find).and_return(:mensaje)
    #             patch :update, params: parametros
    #             expect(response).to redirect_to(mensaje_url(@user, @chat, :mensaje))
    #         end
    #     end

        # context "with invalid parameters" do
        #     let(:invalid_params) { { user_id: @user.id, chat_id: 
        # @chat.id, mensaje: {id: nil, contenido: "Nuevo mensaje", nombre: nil} } }
        
        #     it "re-renders the :edit template" do
        #         post :create, params: invalid_params
        #         get :edit, params: { user_id: @user.id, chat_id: @chat.id, id: @mensaje.id}
        #         expect(response).to render_template(:edit)
        #     end
        
        #     it "returns unprocessable entity status" do
        #         post :create, params: invalid_params
        #         expect(response).to have_http_status(:unprocessable_entity)
        #     end
        # end
end