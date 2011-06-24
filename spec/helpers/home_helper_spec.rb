require 'spec_helper'

describe HomeHelper do

  describe :pretty_date do
    before { @regex = /(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (0[1-9]|[1-2][0-9]|3[01]) \d{2}:\d{2} (am|pm)/ }
    subject { helper.pretty_date(Time.now) }
    it("should be in format mmm dd hh:mm am/pm") { should =~ @regex }
  end
  
  describe :link_to_tracking_service do
    context "with a package_id" do
      before do
        @name = "MockService"
        @package_id = "XXX"
        @url = link_to_tracking_service(@name, @package_id)
      end
      subject { @url }
      it { should eq link_to(@name, "mock://www.service.com?package_id=#{@package_id}") }
    end
    context "without a package_id" do
      before do
        @name = "MockService"
        @url = link_to_tracking_service(@name)
      end
      subject { @url }
      it { should eq link_to(@name, "mock://www.service.com") }
    end
  end
  
end
