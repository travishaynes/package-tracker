require 'spec_helper'

describe HomeController do
  
  context "with params[:package_id]" do
    before { get :index, :package_id => 'EJ958083578US' }
    it "should assign @tracking" do
      assigns(:tracking).should be_kind_of Trackerific::Details
    end
    it  "should assign @service" do
      assigns(:service).should be_kind_of String
    end
  end
  
end
