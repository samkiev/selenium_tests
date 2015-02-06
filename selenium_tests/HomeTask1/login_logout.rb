class Login_logout
  require 'selenium-webdriver'

  browser = Selenium::WebDriver.for :chrome
  #Login
      login = "testuser45"
      browser.get 'http://demo.redmine.org'
      browser.find_element(class: "login").click
      browser.find_element(id: "username").send_key(login)
      browser.find_element(id: "password").send_key(login)
      browser.find_element(name: "login").click

    sleep 2

  #logout

      browser.find_element(class: "logout").click
end