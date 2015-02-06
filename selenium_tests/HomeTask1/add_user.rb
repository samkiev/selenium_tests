class Add_user
  require 'selenium-webdriver'

  browser = Selenium::WebDriver.for :chrome
#login
  login = "testuser45"
  password = "testuser45"
  additionuser = "testuser"

        browser.get 'http://demo.redmine.org'
        browser.find_element(class: "login").click
        browser.find_element(id: "username").send_key(login)
        browser.find_element(id: "password").send_key(password)
        browser.find_element(name: "login").click
  sleep 2
        browser.find_element(id: "project_quick_jump_box").click
        browser.find_element(css: "option:nth-child(6)").click
  sleep 2
        browser.find_element(class: "settings").click
        browser.find_element(id: "tab-members").click
        browser.find_element(id: "principal_search").send_key(additionuser)
        browser.find_element(css: "fieldset > div > label > input[value=91092]").click
        browser.find_element(name: "membership[role_ids][]").click
        browser.find_element(id: "member-add-submit").click
end