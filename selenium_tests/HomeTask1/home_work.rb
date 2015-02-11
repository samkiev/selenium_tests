require 'selenium-webdriver'

browser = Selenium::WebDriver.for :chrome



browser.get 'http://demo.redmine.org'

browser.get 'http://demo.redmine.org'
add_to_login = "622"
login = "testuser" + add_to_login
password = login
new_password = password + add_to_login
new_user_login = "newtestuser" + add_to_login
name_new_user = "itlabs"+ add_to_login
project_name = name_new_user + "project" + add_to_login
version_name = "new_version"+add_to_login
subject_bug = "bug_issue"
subject_feature = "feature_issue"
subject_support = "support_issue"

#Register_method
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
            if (browser.find_element(id: "flash_notice").text) == 'Ваша учётная запись активирована. Вы можете войти.'

              puts 'User registration = OK'

            else

              puts 'Registration failed'

            end
            #SAVE ID wich use to find user
              id_user = browser.find_element(class: "active").attribute("href")[-5,5]
                  puts "Id of new user = " + id_user
    end

#Register_new_user_method

    def self.create_new_account(browser, new_user_login, password, name_new_user)


          #fill fields
          browser.find_element(class: "register").click
          browser.find_element(id: "user_login").send_key new_user_login
          browser.find_element(id: "user_password").send_key password
          browser.find_element(id: "user_password_confirmation").send_key password
          browser.find_element(id: "user_firstname").send_key name_new_user
          browser.find_element(id: "user_lastname").send_key name_new_user
          browser.find_element(id: "user_mail").send_key new_user_login + "@usermail.com"
          Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "user_language")).
              select_by(:value, "en")
          browser.find_element(name: "commit").click
        sleep 2

          #Check registration
            if (browser.find_element(id: "flash_notice").text) == 'Ваша учётная запись активирована. Вы можете войти.'

              puts 'New user registration = OK'

            else

              puts 'Registration failed'

            end
          #SAVE ID witch use to find user
          id_user = browser.find_element(class: "active").attribute("href")[-5,5]
          puts "Id of new user = " + id_user

    end

#ID User Method
        def get_user_id(browser)
          id_user = browser.find_element(class: "active").attribute("href")[-5, 5]
          return id_user
        end

#Logout_method
        def logged_out(browser)
            browser.find_element(class: "logout").click
                  sleep 2
        #Check logout
            if (browser.title) == "Redmine demo"
                     puts "Log out = OK"
            else puts "Log out Failed"
          end
        end

#Login_method
    def logged_in(browser, login, password)
      browser.find_element(class: "login").click
      browser.find_element(id: "username").send_key(login)
      browser.find_element(id: "password").send_key(password)
      browser.find_element(name: "login").click
      sleep 2
    #Check login
      if (browser.find_element(class: "active").text) == login
        puts "Login  1-st user = OK"
      else
        puts "Login Failed"
      end
    end

#Change password
    def change_password(browser, password, new_password)
      browser.find_element(class: "my-account").click
      browser.find_element(class: "icon-passwd").click
      browser.find_element(id: "password").send_key(password)
      browser.find_element(id: "new_password").send_key(new_password)
      browser.find_element(id: "new_password_confirmation").send_key(new_password)
      browser.find_element(name: "commit").click
      sleep 2
      #Check Change password
        if (browser.find_element(id: "flash_notice").text) == 'Password was successfully updated.'
            puts "Change password = OK"
          else
            puts "Change password = failed"
          end
    end

#Create new  project
    def create_new_project(browser, project_name)

      browser.find_element(class: "projects").click
      browser.find_element(class: "icon-add").click
      browser.find_element(id: "project_name").send_key(project_name)
      browser.find_element(id: "project_description").send_key("projectname")
      browser.find_element(id: "project_identifier").clear

      browser.find_element(id: "project_identifier").send_keys(project_name+'id')
      sleep 2
      browser.find_element(id: "project_inherit_members").click
      browser.find_element(name: "commit").click
      sleep 2
      # Check Creation
        if (browser.find_element(id: "flash_notice").text) == 'Successful creation.'
          puts "Create new project = OK"
        else
          puts "Create new project = failed"
        end
    end
# Add another(new) user to the project

    def add_new_user_to_project(browser, name_new_user, user_id)

        browser.find_element(id: "tab-members").click
        browser.find_element(id: "principal_search").send_key(name_new_user)
    sleep 2
        browser.find_element(css: "#principals>label>input[value='#{user_id}']").click
        browser.find_element(css: "#new_membership>fieldset>p>label>input[value='5']").click
        browser.find_element(css: "#new_membership>fieldset>p>label>input[value='4']").click
        browser.find_element(id: "member-add-submit").click
    sleep 2

      if browser.find_element(partial_link_text: name_new_user).displayed?
          puts "Add new user = OK"
              else
          puts "Create new project = failed"
      end

    end
#Get Project New User ID method
        def get_project_user_id(browser)
            project_user_id = browser.find_element(class: "even").attribute("id")[-5, 5]

        return project_user_id
        end
# Edit Users Roles
    def edit_user_roles(browser, project_user_id)
          browser.find_element(css: "#member-#{project_user_id} a.icon.icon-edit").click
          browser.find_element(css: "#member-#{project_user_id}-roles-form input[value='4']").click
          browser.find_element(css: "#member-#{project_user_id}-roles-form input[value='Save']").click
    #Check Changes of role
      sleep 2

        if (browser.find_element(id: "member-#{project_user_id}-roles").text) == 'Reporter'
        puts "Edit Roles new user = OK"
           else
              puts "Edit Roles new user  = failed"
        end
    end
# Create Project Version
    def create_new_project_version(browser, version_name)
      browser.find_element(id: "tab-versions").click
      browser.find_element(class: "icon-add").click
      browser.find_element(id: "version_name").send_keys version_name
      browser.find_element(name: "commit").click
      sleep 2
      if browser.find_element(link_text: version_name).displayed?
        puts "Create Project version = OK"
      else
        puts "Create Project version = Failed"

      end
    end
#Create Bug insue
    def create_bug_insue(browser, subject_bug, version_name)
      browser.find_element(class: "new-issue").click

      Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_tracker_id")).
          select_by(:value, "1")
      browser.find_element(id: "issue_subject").send_keys subject_bug
      #browser.find_element(id: "issue_description").send_keys "Steps to reprosuce"
      #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_status_id")).
      #    select_by(:value, "2")
      #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_priority_id")).
       #   select_by(:value, "5")
      #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_fixed_version_id")).
       #   select_by(:text, version_name)
      browser.find_element(name: "commit").click
      puts "Create Bug issue = OK"
      sleep 2

    end

#Create Feature Issue
    def create_feature_issue(browser, subject_feature)
      browser.find_element(class: "new-issue").click

      Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_tracker_id")).
          select_by(:value, "2")
      browser.find_element(id: "issue_subject").send_keys subject_feature
#      browser.find_element(id: "issue_description").send_keys "Steps to reprosuce"
      #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_status_id")).
        #  select_by(:value, "2")
      #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_priority_id")).
         # select_by(:value, "4")
    #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_fixed_version_id")).
    #   select_by(:text, version_name)
      browser.find_element(name: "commit").click
      puts "Create Feature issue = OK"
      sleep 2

    end

#Create Support Issue
    def create_support_issue(browser, subject_support)
      browser.find_element(class: "new-issue").click

      Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_tracker_id")).
          select_by(:value, "3")
      browser.find_element(id: "issue_subject").send_keys subject_support
      #browser.find_element(id: "issue_description").send_keys "Steps to reprosuce"
      #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_status_id")).
      #    select_by(:value, "2")
      #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_priority_id")).
       #   select_by(:value, "4")
    #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_fixed_version_id")).
    #   select_by(:text, version_name)
      browser.find_element(name: "commit").click
      sleep 2
      puts "Create Support issue = OK"
    end
#Main
    create_account(browser, login, password)

    logged_out(browser)

    create_new_account(browser, new_user_login, password, name_new_user)
            get_user_id(browser)                                #Extract User ID
                                                                user_id = get_user_id(browser)
    logged_out(browser)

    logged_in(browser, login, password)

    change_password(browser, password, new_password)

    create_new_project(browser, project_name)

    add_new_user_to_project(browser, name_new_user, user_id)

            get_project_user_id(browser)                        #Extract Project ID
                                                                project_user_id =  get_project_user_id(browser)
    edit_user_roles(browser, project_user_id)

    create_new_project_version(browser, version_name)

    create_bug_insue(browser, subject_bug, version_name)

                                                            #Extract bug value
                      issue_id_bug = browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]

    create_feature_issue(browser, subject_feature)
                                                                #Extract Feature Value
                      issue_id_feature = browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]

    create_support_issue(browser, subject_support)
                                                                #Extract Support_inssue Value
                      issue_id_support = browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]

    browser.find_element(class: "selected").click
    if (browser.find_element(link_text: issue_id_bug))&&(browser.find_element(link_text: issue_id_feature))&&(browser.find_element(link_text: issue_id_support)).displayed?
      puts "All issues are not visible on ‘Issues’ tab = OK"
      else
        puts "All issues are  visible"
    end