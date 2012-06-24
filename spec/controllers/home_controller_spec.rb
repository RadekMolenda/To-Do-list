require 'spec_helper'

describe HomeController do
  describe "#index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
    it "assigns all tasks to @tasks" do
      task = FactoryGirl.create(:task)
      get :index
      assigns(:tasks).should eq([task])
    end
  end

end
