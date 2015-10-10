require 'rails_helper'
​
RSpec.describe TasksController, type: :controller do
  let (:users){ FactoryGirl.create(:users) }
  before(:each) do
    sign_in users
  end
​
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
​
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
​
  describe "POST #create" do
    it "creates a new task with name of Hide this thing" do
      task_params = {task:{name: 'Hide this thing', location: 'Salt Lake City, UT', description: 'lots of words'}}
      expect(Task.count).to eq(0)
      post :create, task_params
      expect(Task.count).to eq(1)
      expect(Task.last.name).to eq("Hide this thing")
      expect(Task.last.location).to eq('Salt Lake City, UT')
      expect(Task.last.description).to eq("lots of words")
    end
  end
​
  describe "GET #edit" do
    it "returns edited task" do
      task = Task.create(name:"Hide Stuff")
      get :edit, {id: task.id}
      expect(assigns(:task).name).to eq("Hide Stuff")
    end
  end
 
  describe "PUT #update" do
    it "updates a task" do
      task = Task.create(name:'Find Milk Price')
      update_params = {id: task.id, task:{name: 'hide grandma'}}
    put :update, update_params
    task = task.reload
    expect(task.name).to eq('hide grandma')     
    end
  end
​
  describe "DELETE #destroy" do
    it 'deletes task' do 
      task = Task.create(name: 'Pick up crayons')
      delete :destroy, {id: task.id}
      expect(Task.count).to eq(0)
    end
  end 
​
  
end