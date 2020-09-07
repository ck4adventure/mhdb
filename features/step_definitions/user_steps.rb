Given('I am currently logged out') do
  visit(root_path)
end

Given('there is a {string} link in the header') do |string|
  find('header').find_link(string)
end

When('I click the {string} link in the header') do |string|
  find('header').click_link(string)
end

Then('I should be taken to the {string} form') do |string|
  find_field(id: string)
end

Then('it should have the content {string}') do |string|
  expect(page).to have_content(string)
end

Then('it should have a form input for {string}') do |string|
  find_field(string)
end

Then('it should have a button to {string}') do |string|
  find_button(string)
end

Given('I am viewing the {string} form') do |string|
  find_field(id: string)
end

Given('my name is {string}') do |string|
  larry = User.new(name: string)
end

Given('my email is {string}') do |string|
  larry.email = string
end

When('I fill in the form input for {string}') do |string|
end

When('I click the {string} button') do |string|
  click_button(string)
end

Then('my user info should be saved in the db') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('a session token is set in my browser') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be redirected to the root page') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I already have an account') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I fill in the field for {string} with {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should get an error message') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('it should say {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('it should have a link to {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I have an existing account') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('it has the name {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('it has the email {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I fill in the field for email with {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be succesfully signed in') do
  pending # Write code here that turns the phrase above into concrete actions
end
