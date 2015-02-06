class Change_password
  require 'selenium-webdriver'

  browser = Selenium::WebDriver.for :chrome
#login
      login = "testuser45"
      password = "testuser45"
      new_password = "testuser54"

          browser.get 'http://demo.redmine.org'
          browser.find_element(class: "login").click
          browser.find_element(id: "username").send_key(login)
          browser.find_element(id: "password").send_key(password)
          browser.find_element(name: "login").click
  sleep 2
  #Change password
          browser.find_element(class: "my-account").click
          browser.find_element(class: "icon-passwd").click
          browser.find_element(id: "password").send_key(password)
          browser.find_element(id: "new_password").send_key(new_password)
          browser.find_element(id: "new_password_confirmation").send_key(new_password)
          browser.find_element(name: "commit").click
  sleep 2
end