require 'spec_helper'

describe TasksController do
  describe "GET index" do
    it "should be success when JSON format" do
      get :index, format: :json
      response.should be_success
    end
  end
  describe "GET show" do
    it "should be success when JSON format" do
      task = FactoryGirl.create(:task)
      get :edit, :id => task.id, format: :json
      response.should be_success
    end
  end
  describe "GET edit" do
    it "should be success when JSON format" do
      task = FactoryGirl.create(:task)
      get :edit, :id => task.id, format: :json
      response.should be_success
    end
  end
  describe "POST create" do
    it "creates a new task" do
      pending
      expect {
        post :create, FactoryGirl.attributes_for(:task)
      }.to change(Task, :count).by(1)
    end
  end
  describe "DELETE destroy" do
    it "deletes the task" do
      task = FactoryGirl.create(:task)
      expect {
        delete :destroy, :id => task.to_param
      }.to change(Task, :count).by(-1)
    end
  end
end
