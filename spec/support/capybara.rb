require 'capybara/rails'
require 'capybara/poltergeist'

capybara_driver = ENV['CAPYBARA_DRIVER'] || :rack_test
puts "Using Capybara Driver: #{capybara_driver}"

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = capybara_driver.to_sym
