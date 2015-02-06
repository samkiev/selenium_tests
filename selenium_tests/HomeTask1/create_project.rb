class Create_project
  require 'selenium-webdriver'

  browser = Selenium::WebDriver.for :chrome
#login
  login = "testuser45"
  password = "testuser45"


      browser.get 'http://demo.redmine.org'
      browser.find_element(class: "login").click
      browser.find_element(id: "username").send_key(login)
      browser.find_element(id: "password").send_key(password)
      browser.find_element(name: "login").click
  sleep 2

 #Create project
  projectname = "testproject2"
      browser.find_element(class: "projects").click
      browser.find_element(class: "icon-add").click
      browser.find_element(id: "project_name").send_key("Project Description")
      browser.find_element(id: "project_description").send_key(projectname)
      browser.find_element(id: "project_identifier").clear
      browser.find_element(id: "project_identifier").send_keys("projectid")
      browser.find_element(id: "project_inherit_members").click
      browser.find_element(name: "commit").click
  sleep 2
end