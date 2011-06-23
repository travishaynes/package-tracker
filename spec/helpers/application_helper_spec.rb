require 'spec_helper'

describe ApplicationHelper do
  
  describe :include_validations do
    before { helper.include_validations }
    
    it "should include validations script" do
      helper.content_for(:head).should include javascript_include_tag("validations")
    end
    
    it "should include validations css" do
      helper.content_for(:head).should include stylesheet_link_tag('validations')
    end
  end
  
end
