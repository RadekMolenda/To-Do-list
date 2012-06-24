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
  describe "GET new" do
    it "should be success when JSON format" do
      get :new, format: :json
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
    describe "with valid params" do
      it "creates a new post" do
        pending
        expect {
          post :create, FactoryGirl.attributes_for(:task), format: :json
        }.to change(Task, :count).by(1)
      end
    end

  end
end
