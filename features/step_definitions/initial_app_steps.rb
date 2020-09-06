Given('there is an app') do
  
end

When('I visit {string}') do |string|
  visit ('/')
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

Then('the page title should be {string}') do |string|
  expect(page).to have_title(string)
end