require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
      @producto = FactoryBot.create(:producto, user: @user)
      @like = FactoryBot.create(:like, producto: @producto, user: @user)
  end

    describe "GET #index" do
      it "renders the :index template" do
        allow(User).to receive(:find).and_return(@user)
          get :index, params: { user_id: @user.id}
          expect(response).to render_template(:index)
      end
    end

    describe "DELETE destroy" do

      it "destroys the like" do
        allow(User).to receive(:find).and_return(@user)
          allow(Like).to receive(:find).and_return(@like)
          expect(@like).to receive(:destroy)
          delete :destroy, params: { user_id: @user.id, id: @like.id}
          @like.destroy
      end
    end

    describe 'POST #create' do
      context 'cuando ya se ha dado "like"' do
        it 'no hace nada' do
          allow(controller).to receive(:already_liked?).and_return(true)
            post :create, params: { user_id: @user.id, producto_id: @producto.id, id: @like.id}
        end
      end
    
        context 'cuando aún no se ha dado "like"' do
          it 'crea un nuevo like' do
            allow(controller).to receive(:already_liked?).and_return(false)
              post :create, params: { user_id: @user.id, producto_id: @producto.id, id: @like.id }
              expect(response).to redirect_to(producto_url(@user, @producto))
          end
        end
    end
end