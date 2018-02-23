require "test_helper"

describe ClientsController do
  it "should get index" do
    get :index
    value(response).must_be :success?
  end

end
