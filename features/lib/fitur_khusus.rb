class FiturKhusus
  def initialize(driver)
    @driver = driver
  end

  def fitur_invoice
    btn_fitur_khusus = @driver.find_element(:xpath, '//*[@id="app"]/div[2]/div[1]/ul/li[4]/a/div')
    btn_fitur_khusus.click
    sleep(2)
    btn_tagihanmassal = @driver.find_element(:xpath, '//*[@id="app"]/div[2]/div[1]/ul/li[4]/ul/li[2]/a/div/div[3]')
    btn_tagihanmassal.click
    sleep(2)
    btn_listinvoice = @driver.find_element(:xpath, "//a[contains(@href,'invoice.list')]//div[contains(@class,'d-grid-12 p-x-20 p-y-16 menu-box-text')]")
    btn_listinvoice.click
    sleep(2)
  end

  def verify_fiturkhusus
    listinvoice_checking = @driver.find_element(:id, 'invocie-list')
    if listinvoice_checking.displayed?
      puts "List Invoice-nya terverifikasi ada buat fitur_invoice."
    end
    sleep(2)
  end
end