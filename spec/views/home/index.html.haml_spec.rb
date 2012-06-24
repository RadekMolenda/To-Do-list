require 'spec_helper'

describe "home/index" do
  before :each do
    render
  end
  it "should have input#new_task" do
    rendered.should have_css("form input#new_task")
  end
  it "should have the right header" do
    rendered.should have_content("To Do List")
  end
  it "should have #incomplete div for incompleted tasks list" do
    rendered.should have_css("#incompleted")
  end
  it "should have #complete div for completed tasks list" do
    rendered.should have_css("#completed")
  end
end
