Given(/^User already login with credentials record (.*)$/) do |record|
  openwebsite = LoginSmartOwner.new(@driver)
  openwebsite.navigate_to
  loginwithrecord = LoginSmartOwner.new(@driver)
  loginwithrecord.exec_login_with_record(record)
  verifylogin = LoginSmartOwner.new(@driver)
  verifylogin.verify_login
end

When(/^User log into Fitur Khusus function$/) do
  fiturinvoice = FiturKhusus.new(@driver)
  fiturinvoice.fitur_invoice
end

Then(/^The page of Fitur Khusus is displayed$/) do
  verify = FiturKhusus.new(@driver)
  verify.verify_fiturkhusus
end
