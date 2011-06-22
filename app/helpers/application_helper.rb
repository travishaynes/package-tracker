module ApplicationHelper
  
  def include_validations
    content_for(:head) do
      stylesheet_link_tag('validations') +
      javascript_include_tag('validations')
    end
  end
  
end
