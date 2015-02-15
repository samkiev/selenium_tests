class Register
  require 'selenium-webdriver'

    browser = Selenium::WebDriver.for :chrome



  browser.get 'http://demo.redmine.org'
  login = "testuser511334r7"
  password = login
  new_user_login = "66"

  def self.create_account(browser, login, password)


        #fill fields
        browser.find_element(class: "register").click
        browser.find_element(id: "user_login").send_key login
        browser.find_element(id: "user_password").send_key password
        browser.find_element(id: "user_password_confirmation").send_key password
        browser.find_element(id: "user_firstname").send_key "name_"+login
        browser.find_element(id: "user_lastname").send_key "last_name_"+login
        browser.find_element(id: "user_mail").send_key login + "@usermail.com"
        Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "user_language")).
                                                            select_by(:value, "en")
        browser.find_element(name: "commit").click
    sleep 2

          #Check registration

         # if browser.find_element(id: "errorExplanation").enabled?
          #system_message = browser.find_element(id: "errorExplanation").text
           # puts 'Test failed! Impossible to continue. Message: '+ system_message
            #  else

              if (browser.find_element(id: "flash_notice").text) == 'Ваша учётная запись активирована. Вы можете войти.'

                       puts 'Successful registration = OK'

                else

                       puts 'Registration failed'

              end
       #idelement = browser.find_element(class: "active").attribute("href")[-5,5]
   #puts  idelement
  end


  def self.getidel(browser)
    idelement = browser.find_element(class: "active").attribute("href")[-5, 5]
   # puts idelement
    return idelement
  end

  create_account(browser, login, password)



 puts getidel(browser)



end