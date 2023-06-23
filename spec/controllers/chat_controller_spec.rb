require 'rails_helper'

RSpec.describe ChatsController, type: :controller do
  describe 'GET index' do

    before do
      @user = FactoryBot.create(:user)
        get :index, params: { user_id: @user.id }
    end

    it 'assigns @users' do
      expect(assigns(:users)).to eq(User.all)
    end

    it 'assigns @user' do
      expect(assigns(:user)).to eq(@user)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end


 #metodo show
  describe "GET #show" do
    before do
      @user = FactoryBot.create(:user)
      @chat = FactoryBot.create(:chat, user: @user)
    end

    it "assigns the requested user to @user" do
      get :show, params: { user_id: @user.id, id: @chat.id }
      expect(assigns(:user)).to eq(@user)
    end

    it "assigns the requested chat to @chat" do
      get :show, params: { user_id: @user.id, id: @chat.id }
      expect(assigns(:chat)).to eq(@chat)
    end

    it "renders the :show template" do
      get :show, params: { user_id: @user.id, id: @chat.id }
      expect(response).to render_template(:show)
    end
  end

  #metodo new
  describe "GET #new" do
    before do
      @user = FactoryBot.create(:user)
      @chat = FactoryBot.create(:chat, user: @user)
    end
    it "assigns the requested user to @user" do
      get :new, params: { user_id: @user.id }
      expect(assigns(:user)).to eq(@user)
    end

    it "assigns a new chat to @chat" do
      get :new, params: { user_id: @user.id }
      expect(assigns(:chat)).to be_a_new(Chat)
    end

    it "renders the :new template" do
      get :new, params: { user_id: @user.id }
      expect(response).to render_template(:new)
    end
  end

#metodo create
  describe "POST #create" do
    before do
      @user = FactoryBot.create(:user)
    end
    context "with valid parameters" do
      let(:valid_params) { { user_id: @user.id, chat: { asunto: "New Chat" } } }

      it "creates a new chat" do
        expect {
          post :create, params: valid_params
        }.to change(Chat, :count).by(1)
      end

      it "assigns the created chat to @chat" do
        post :create, params: valid_params
        expect(assigns(:chat)).to be_a(Chat)
        expect(assigns(:chat)).to be_persisted
      end

      it "redirects to the created chat" do
        post :create, params: valid_params
        expect(response).to redirect_to(chat_url(@user, assigns(:chat)))
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) { { user_id: @user.id, chat: { asunto: nil } } }

      it "does not create a new chat" do
        expect {
          post :create, params: invalid_params
        }.to_not change(Chat, :count)
      end

      it "re-renders the :new template" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end

      it "returns unprocessable entity status" do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

#metodo edit
  describe "GET #edit" do
    before do
      @user = FactoryBot.create(:user)
      @chat = FactoryBot.create(:chat, user: @user)
    end

    it "assigns the requested user to @user" do
      get :edit, params: { user_id: @user.id, id: @chat.id }
      expect(assigns(:user)).to eq(@user)
    end

    it "assigns the requested chat to @chat" do
      get :edit, params: { user_id: @user.id, id: @chat.id }
      expect(assigns(:chat)).to eq(@chat)
    end

    it "renders the :show template" do
      get :edit, params: { user_id: @user.id, id: @chat.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    before do
      @user = FactoryBot.create(:user)
      @chat = FactoryBot.create(:chat, user: @user)
    end

    it "finds the requested user and chat" do
      expect(User).to receive(:find).with(@user.id.to_s).and_return(@user)
      expect(@user.chats).to receive(:find).with(@chat.id.to_s).and_return(@chat)
      delete :destroy, params: { user_id: @user.id, id: @chat.id }
    end

    it "destroys the chat" do
      allow(User).to receive(:find).and_return(@user)
      allow(@user.chats).to receive(:find).and_return(@chat)
      expect(@chat).to receive(:destroy)
      delete :destroy, params: { user_id: @user.id, id: @chat.id }
    end

    it "redirects to the chat list" do
      allow(User).to receive(:find).and_return(@user)
      allow(@user.chats).to receive(:find).and_return(@chat)
      delete :destroy, params: { user_id: @user.id, id: @chat.id }
      expect(response).to redirect_to(ver_chats_url(@user))
    end

    it "returns the correct status code" do
      allow(User).to receive(:find).and_return(@user)
      allow(@user.chats).to receive(:find).and_return(@chat)
      delete :destroy, params: { user_id: @user.id, id: @chat.id }
      expect(response).to have_http_status(:see_other)
    end
  end

#metodo update
  # describe "PATCH #update" do
  #   before do
  #     @user = FactoryBot.create(:user)
  #     @chat = FactoryBot.create(:chat, user: @user)
  #   end
  #   context "with valid parameters" do
  #     let(:valid_params) {  user_id: @user.id, id: @chat.id, {@chat.asunto = "Updated Chat"} } 
  #     it "finds the requested user and chat" do
  #       expect(User).to receive(:find).with(@user.id.to_s).and_return(@user)
  #       expect(@user.chats).to receive(:find).with(@chat.id.to_s).and_return(@chat)
  #       patch :update, params: valid_params
  #     end

  #     it "updates the chat" do
  #       allow(User).to receive(:find).and_return(@user)
  #       allow(@user.chats).to receive(:find).and_return(@chat)
  #       expect(@chat).to receive(:update).with(valid_params)
  #       patch :update, params: valid_params
  #     end

  #     it "redirects to the updated chat" do
  #       allow(User).to receive(:find).and_return(@user)
  #       allow(@user.chats).to receive(:find).and_return(@chat)
  #       patch :update, params: valid_params
  #       expect(response).to redirect_to(@chat)
  #     end
  #   end
  #   context "with invalid parameters" do
  #     let(:invalid_params) {user_id: @user.id, id: @chat.id, {@chat.asunto = nil} }

  #     it "finds the requested user and chat" do
  #       expect(User).to receive(:find).with(@user.id.to_s).and_return(@user)
  #       expect(@user.chats).to receive(:find).with(@chat.id.to_s).and_return(@chat)
  #       patch :update, params: invalid_params
  #     end

  #     it "does not update the chat" do
  #       allow(User).to receive(:find).and_return(@user)
  #       allow(@user.chats).to receive(:find).and_return(@chat)
  #       expect(@chat).not_to receive(:update)
  #       patch :update, params: invalid_params
  #     end

  #     it "re-renders the :edit template" do
  #       allow(User).to receive(:find).and_return(@user)
  #       allow(@user.chats).to receive(:find).and_return(@chat)
  #       patch :update, params: invalid_params
  #       expect(response).to render_template(:edit)
  #     end

  #     it "returns unprocessable entity status" do
  #       allow(User).to receive(:find).and_return(@user)
  #       allow(@user.chats).to receive(:find).and_return(@chat)
  #       patch :update, params: invalid_params
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end
  #   end
  # end
end