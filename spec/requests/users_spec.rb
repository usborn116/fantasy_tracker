require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe 'GET methods' do

    context "Users controller" do
      
      before(:each) do
        @user = create(:user)
        @user.confirm
      end

      it 'gets "me" page for signed in user' do
        sign_in @user
        get '/api/me'
        expect(response.status).to eq(200)
        res = JSON.parse(response.body)
        expect(res).to include(@user.attributes.slice('name', 'email').as_json(include: [:teams, :leagues, :owned_leagues]))
      end

      it 'gets redirected if not signed in' do
        get "/api/me"
        expect(response.body).to eq("null")
      end
    
    end

  end
end
