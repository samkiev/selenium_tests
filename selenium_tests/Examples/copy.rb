Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "project_quick_jump_box")).
    select_by(:text, "testproject")

sleep 2
browser.find_element(class: "settings").click
browser.find_element(id: "tab-members").click
browser.find_element(id: "principal_search").send_key(additionuser)
sleep 2

browser.find_element(css: "#principals>label>input[value='91593']").click
browser.find_element(css: "#new_membership>fieldset>p>label>input[value='5']").click
browser.find_element(css: "#new_membership>fieldset>p>label>input[value='4']").click
browser.find_element(id: "member-add-submit").click
