Then('I should be taken to the Sign in form') do
  find_field(id: 'sign_in_form')
end

Given('I am viewing the Sign in form') do
  visit new_session_path
end