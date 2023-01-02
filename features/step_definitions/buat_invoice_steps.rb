When(/^User fill the form & make Invoice$/) do
  # createinvoice = BuatInvoice.new(@driver, @wait_terapkan)
  # createinvoice.buat_invoice
end

And(/^User choose Pay Off Later$/) do
  puts "Test 2.1"
end

Then(/^User succeeded make one invoice & the invoice diplayed on Invoice List$/) do
  puts "Test 3"
end

