class Logged_in
  require 'selenium-webdriver'

  browser = Selenium::WebDriver.for :chrome

    login = "testuser45"
    browser.get 'http://demo.redmine.org'
    browser.find_element(class: "login").click
    browser.find_element(id: "username").send_key(login)
    browser.find_element(id: "password").send_key(login)
    browser.find_element(name: "login").click
end