# CONSTANTS
TIMEOUT=180
GRID_HUB="http://zalenium:4444/wd/hub"

if ENV["DRIVER"]
  DRIVER = ENV["DRIVER"]
else
  #DRIVER = "firefox"
  DRIVER = "chrome"
end

# This method to set timeout came from
# http://stackoverflow.com/questions/9014121/how-do-i-change-the-page-load-timeouts-in-watir-webdriver-timeout-in-click-met/9044958#9044958
# however, it's not working as expected :(
# Maybe we can try solutions outlined here instead:
# http://stackoverflow.com/questions/17242404/watir-implicit-wait-doesnt-seem-to-work
# http://stackoverflow.com/questions/18204926/automate-timeout-handling-wait-and-refresh-in-watir
# http://stackoverflow.com/questions/18659847/reload-page-until-it-has-some-element-using-ruby-selenium-webdriver/18660166#18660166
def get_zalenium_browser(scenario)
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = TIMEOUT # seconds – default is 30
  # Remove troublesome characters from scenario names - affects video naming
  scenario_name = scenario.name.clone.gsub(/[#,\(\)]/,'')
  browser = Watir::Browser.new DRIVER.to_sym, :http_client => client, :url => GRID_HUB, :name => scenario_name
  return browser
end

# Return a local browser instead of a Zalenium Browser.
def get_local_browser(scenario)
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = TIMEOUT
  browser = Watir::Browser.new DRIVER.to_sym, :http_client => client
  return browser
end

# Return the proper browser, depending on environment values
def get_browser(scenario)
  if ENV['LOCAL']
    return get_local_browser(scenario)
  end
  get_zalenium_browser(scenario)
end

# Ensure a browser is available for each scenario
Before do |scenario|
  @browser = get_browser(scenario)
end

# Close out the test with a pass/fail status
After do |scenario|
  if @browser 
    cookie_name = "zaleniumTestPassed"
    cookie_value = scenario.failed? ? "false" : "true"
    @browser.cookies.add(cookie_name, cookie_value)
    @browser.quit
  end
end

at_exit do
  puts "Cucumber is Done"
end
