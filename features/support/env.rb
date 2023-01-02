require 'selenium-webdriver'
require 'webdrivers'

Before do
  @driver = Selenium::WebDriver.for :chrome
  @driver.manage.window.maximize
  @wait_terapkan = Selenium::WebDriver::Wait.new(:timeout => 10)
end

After do
  @driver.quit
end