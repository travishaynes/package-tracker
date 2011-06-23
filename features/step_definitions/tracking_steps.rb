Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should see a field named "([^"]*)"$/ do |name|
  page.should have_field(name)
end

Then /^(?:|I )should see a button named "([^"]*)"$/ do |name|
  page.should have_button(name)
end

Then /^the page should have a div with the id "([^"]*)"$/ do |id|
  page.has_xpath?("//div[@id='#{id}']") 
end
