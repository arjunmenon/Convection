require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/show.html.haml" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = @user = Factory(:user)
  end

  it "should render attributes in <p>" do
    render "/users/show.html.haml"
    response.should be_success
  end
end

