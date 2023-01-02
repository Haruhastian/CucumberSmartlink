Given(/^User open the website in browser$/) do
  openwebsite = LoginSmartOwner.new(@driver)
  openwebsite.navigate_to
end

When(/^User login with credentials (.*) and (.*)$/) do |usr, pwd|
  loginwebsite = LoginSmartOwner.new(@driver)
  loginwebsite.exec_login(usr,pwd)
end

When(/^User login with credentials record (.*)$/) do |record|
  loginwithrecord = LoginSmartOwner.new(@driver)
  loginwithrecord.exec_login_with_record(record)
end


Then(/^User succeeded login into the website$/) do
  verifylogin = LoginSmartOwner.new(@driver)
  verifylogin.verify_login
end
