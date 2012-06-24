require 'spec_helper'

describe "home/index" do
  before :each do
    render
  end
  it "should have div#container" do
    rendered.should have_css("div#container")
  end
end
