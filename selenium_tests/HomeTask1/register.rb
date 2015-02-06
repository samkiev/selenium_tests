class Register
  require 'selenium-webdriver'

    browser = Selenium::WebDriver.for :chrome
  browser.get 'http://demo.redmine.org'

  def self.create_account(browser)
    login = "testuser47"


    browser.find_element(class: "register").click
    browser.find_element(id: "user_login").send_key login
    browser.find_element(id: "user_password").send_key login
    browser.find_element(id: "user_password_confirmation").send_key login
    browser.find_element(id: "user_firstname").send_key "testuser11"
    browser.find_element(id: "user_lastname").send_key "usertest11"
    browser.find_element(id: "user_mail").send_key login + "@usermail.com"
    browser.find_element(id: "user_language").click
    browser.find_element(css: "option[value=en]").click
    browser.find_element(name: "commit").click
  end

  # Account Create


  create_account(browser)
    sleep 2
end