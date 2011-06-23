require 'spec_helper'

describe ApplicationController do
  
  controller do
    def index
      raise Trackerific::Error
    end
  end
  
  context "when handling Trackerific::Error exceptions" do
    before { get :index }
    it { should redirect_to root_path }
    describe "flash[:alert]" do
      specify { flash[:alert].should_not be_empty }
    end
  end
  
end
