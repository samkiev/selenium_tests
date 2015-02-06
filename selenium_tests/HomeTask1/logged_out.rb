class Logged_out

    require 'selenium-webdriver'

    browser = Selenium::WebDriver.for :chrome

    # Logget out
    browser.get 'http://demo.redmine.org'

    browser.find_element(class: "logout").click

    sleep 2


end