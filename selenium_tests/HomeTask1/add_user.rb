class Add_user
  require 'selenium-webdriver'
  #require 'Selenium::WebDriver::Support::Select'

  browser = Selenium::WebDriver.for :chrome


#login
  login = "testuser45"
  password = "testuser45"
  additionuser = "kievtest"

        browser.get 'http://demo.redmine.org'
        browser.find_element(class: "login").click
        browser.find_element(id: "username").send_key(login)
        browser.find_element(id: "password").send_key(password)
        browser.find_element(name: "login").click
  sleep 2

      def self.select_method(browser)
        Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "project_quick_jump_box")).
            select_by(:text, "testproject")
      end

  select_method(browser)

  sleep 2
        browser.find_element(class: "settings").click
        browser.find_element(id: "tab-members").click
        browser.find_element(id: "principal_search").send_key(additionuser)
  sleep 2

        browser.find_element(css: "#principals>label>input[value='91593']").click
        browser.find_element(css: "#new_membership>fieldset>p>label>input[value='5']").click
        browser.find_element(css: "#new_membership>fieldset>p>label>input[value='4']").click
        browser.find_element(id: "member-add-submit").click

end