require 'spec_helper'

describe "api/tasks", :type => :api do
  before do
    @task = FactoryGirl.create(:task)
  end

  context "viewing tasks" do
    let(:url) { "/api/tasks" }
    it "should be successful" do
      get "#{url}.json"
      tasks_json = Task.all.to_json
      last_response.body.should eql(tasks_json)
      last_response.status.should eql(200)

      tasks = JSON.parse(last_response.body)

      tasks.any? do |task|
        task["description"] == "MyString"
      end.should be_true
    end
  end
  context "creating tasks" do
    let(:url) {"/api/tasks"}
    it "should be successful" do
      post "#{url}.json", :task => {
                            :description => "Make batter"
                          }
      task = Task.find_by description: "Make batter"
      route = "/api/tasks/#{task.id}"
      last_response.status.should eql(201)
      last_response.headers["Location"].should eql(route)
      last_response.body.should eql(task.to_json)
    end
    it "should be unsuccessful with invalid attributes" do
      post "#{url}.json", :task => {}
      last_response.status.should eql(422)
      errors = {"errors" => {"description" => ["can't be blank"]}}.to_json
      last_response.body.should eql(errors)
    end
  end
  context "show" do
    let(:url) { "/api/tasks/#{@task.id}" }

    it "should be successful" do
      get "#{url}.json"
      task = @task.to_json
      last_response.body.should eql(task)
      last_response.status.should eql(200)
    end
  end
  context "updating task" do
    let(:url) { "/api/tasks/#{@task.id}"}
    it "should be successful" do
      @task.description.should eql("MyString")

      put "#{url}.json",  :task => {
                            :description => "Make delicious cake"
                          }
      last_response.status.should eql(204)
      @task.reload
      @task.description.should eql("Make delicious cake")
    end
    it "should be unsuccessful with invalid attributes" do
      @task.description.should eql("MyString")
      put "#{url}.json",  :task => {
                            :description => ""
                          }
      last_response.status.should eql(422)
      @task.reload
      @task.description.should eql("MyString")
      errors = {"errors" => {"description" => ["can't be blank"]}}.to_json
      last_response.body.should eql(errors)
    end
  end

  context "deleting a task" do
    let(:url) { "/api/tasks/#{@task.id}"}
    it "should be successful" do
      delete ("#{url}.json")
      last_response.status.should eql(204)
    end
  end

end
