require 'rails_helper'

RSpec.describe UsersController, type: :controller do
​
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
​
  describe "GET #show" do
    it "returns a user" do
      user = User.create(first_name: 'Caleb')
      get :show, {id: user.id}
      expect(user.first_name).to eq('Caleb')
    end
  end
​
end
