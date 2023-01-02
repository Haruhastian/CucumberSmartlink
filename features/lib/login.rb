class LoginSmartOwner

  def initialize(driver)
    @driver = driver
  end

  def navigate_to
    @driver.get 'https://smartlink-frontend-dev2-fljnd6wana-de.a.run.app/login'
    @driver.manage.timeouts.implicit_wait = 10
  end

  def exec_login(usr,pwd)
    #Find E-mail
    btn_email = @driver.find_element(:id, 'nav-profile-tab')
    btn_email.click

    btn_email_input = @driver.find_element(:id, 'input-2')
    btn_email_input.send_keys(usr)

    #Find Password
    btn_password = @driver.find_element(:id, 'password-field')
    btn_password.click
    btn_password_input = @driver.find_element(:id, 'password-field')
    btn_password_input.send_keys(pwd)

    #Login Klik!
    @driver.find_element(:id, 'btnLoginEmail').click
    sleep(3)
  end

  def exec_login_with_record(record)
    data_record = YAML.load(File.read('C:\Users\Smartlink Hastian\RubymineProjects\SmartlinkCucumber\features\data\record.yaml'))
    username_value = data_record["#{record}"]['username']
    password_value = data_record["#{record}"]['password']

    #Find E-mail
    btn_email = @driver.find_element(:id, 'nav-profile-tab')
    btn_email.click

    btn_email_input = @driver.find_element(:id, 'input-2')
    btn_email_input.send_keys(username_value)

    #Find Password
    btn_password = @driver.find_element(:id, 'password-field')
    btn_password.click
    btn_password_input = @driver.find_element(:id, 'password-field')
    btn_password_input.send_keys(password_value)

    #Login Klik!
    @driver.find_element(:id, 'btnLoginEmail').click
    sleep(3)
  end

  def verify_login
    lewati_notif = @driver.find_element(:xpath, '//*[@id="view-screen"]/div/div[1]/span')
    #Kalau ada notif awal, diclick.
    if lewati_notif.displayed?
      lewati_notif.click
      puts "Lewati berhasil diklik."
    else
      puts "Tidak ada notif awal."
    end

    if @driver.title == "SMART OWNER By SMARTLINK"
      puts "Test Passed - Title SMART OWNER found."
    else
      @driver.save_screenshot('failed_login.png', full_page: false)
      raise "Test Failed."
    end
  end

end