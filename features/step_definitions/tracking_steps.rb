Then /^the page should have a div with the id "([^"]*)"$/ do |id|
  page.has_xpath?("//div[@id='#{id}']") 
end
