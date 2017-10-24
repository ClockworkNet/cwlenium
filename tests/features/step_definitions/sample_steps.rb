Given("a web browser") do
  # returns an error if it does not exist
  @browser.assert_exists 
end

When(/I navigate to (.*)/) do |url|
  @browser.goto url
end

Then('I see the title {string}') do |string|
  expect(@browser.title).to eq string
end