
Given('there are a set number of Ranks') do
  @ranks = Rank.all
end

When('I view the Ranks page') do
  visit(ranks_path)
end

Then('I should see all of the available Ranks') do
  find_field('ranks_list')
end

Then('they should be in order') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a mark indicating my rank') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I am signing up as a new User') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I submit the sign up form') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I have not selected a Rank') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be given the default Rank of Novice') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I view then sign up form') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a list of possible ranks') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be able to select one') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('it should be listed on my Info Page') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I have attained a new Rank') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('I am viewing my User Info Page') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I choose a new Rank from the Select Dropdown') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click the Submit button') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see my page refresh') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see my new Rank listed') do
  pending # Write code here that turns the phrase above into concrete actions
end