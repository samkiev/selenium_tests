require 'selenium-webdriver'

@browser = Selenium::WebDriver.for :firefox

def message_is( message)
  @browser.find_element(id: 'flash_notice').text.include? message
end

def open_home_page
  @browser.get 'http://demo.redmine.org'
end

def open_register_page
  @browser.find_element(class: 'register').click
end

def register_as(login)
  @browser.find_element(id: 'user_login').send_keys login
  @browser.find_element(id: 'user_password').send_keys 'qwer'
  @browser.find_element(id: 'user_password_confirmation').send_keys 'qwer'
  @browser.find_element(id: 'user_firstname').send_keys 'qwer'
  @browser.find_element(id: 'user_lastname').send_keys 'qwer'
  @browser.find_element(id: 'user_mail').send_keys(login + '@asdf.asdf')
  @browser.find_element(name: 'commit').click
end

open_home_page
open_register_page
register_as('asdfasdf')
sleep 2

fail 'Did not meet expected text' unless message_is('Your account has been actiasdfvated. You can now log in.')





