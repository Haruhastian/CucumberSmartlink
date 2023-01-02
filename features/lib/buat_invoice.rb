class BuatInvoice

  def initialize(driver, wait_terapkan)
    @driver = driver
    @wait_terapkan = wait_terapkan
  end

  def buat_invoice(kirim_nota = true)
    btn_tambah_invoice = @driver.find_element(:xpath, "//a[@class='flying-button']")
    btn_tambah_invoice.click

    diterapkanassert = @driver.find_element(:xpath, '//*[@id="modal-filter"]/div/div/div[2]/div[1]/div/div[1]/div[1]/div[2]/div/span').text
    if diterapkanassert == "Diterapkan"
      puts "Wordingnya sama/muncul."
    else
      puts "Wordingnya tidak sama(?)"
    end

    btn_filter_outlet = @driver.find_element(:id, 'select2--container')
    btn_filter_outlet.click
    sleep(2)

    btn_reset_filter_invoice = @driver.find_element(:xpath, "//*[@id='modal-filter']/div/div/div[2]/div[2]/div/button[1]")
    btn_reset_filter_invoice.click
    sleep(2)

    # Mengatur Filter
    btn_transaksi_outlet = @driver.find_element(:class, 'border-top')
    btn_transaksi_outlet.click
    sleep(2)
    btn_dropdown_outlet = @driver.find_element(:xpath, '//*[@id="Nama-Outlet"]/div/span/span[1]/span')
    btn_dropdown_outlet.click
    sleep(2)
    btn_search_outlet = @driver.find_element(:class, 'select2-search__field')
    btn_search_outlet.send_keys("Real Wash")
    btn_search_outlet.send_keys :enter
    sleep(2)


    # Terapkan Filter
    @driver.find_element(:xpath, '//*[@id="modal-filter"]/div/div/div[2]/div[2]/div/button[2]').click
    @wait_terapkan.until do
      @driver.find_element(:xpath, '//*[@id="so-title-bar"]/div/div[2]')
    end
    sleep(2)

    # Cek Transaksi ditemukan
    transaksi_found = "Ditemukan"
    if @driver.find_element(:xpath, '//*[@id="invocie-add"]/div/div[1]/div[2]/div/div[2]/p/span').text =~ /^#{transaksi_found}/
      puts "Transaksi Ditemukan"
    else
      puts "Transaksi Tidak Ditemukan, atau mungkin error(?)"
    end

    # Pilih Checkbox Transaksi Ditemukan
    transaksi_checkbox = @driver.find_element(:xpath, "//div[@id='invocie-add']/div/div/div[2]/div/div[3]/div[2]/div/div/div")
    if transaksi_checkbox.displayed?
      transaksi_checkbox.click
      puts "Checkbox pertama berhasil dicentang."
    end

    pilih_transaksi = @driver.find_element(:id, 'pilih-transaksi')
    pilih_transaksi.click
    @wait_terapkan.until do
      @driver.find_element(:xpath, '//*[@id="so-title-bar"]/div/div[2]').text == "Buat Invoice"
    end

    # Isi dan Edit Form
    nama_penerima = @driver.find_element(:id, 'input-nama')
    nama_penerima.click
    nama_penerima.clear
    nama_penerima.send_keys("HaRuby")
    sleep(3)
    wa_penerima = @driver.find_element(:id, 'input-wa')
    wa_penerima.click
    wa_penerima.clear
    wa_penerima.send_keys("81233759408")
    penanggung_jawab_click = @driver.find_element(:xpath, '//*[@id="Penanggung-Jawab"]/div/span/span[1]/span')
    penanggung_jawab_click.click
    penanggung_jawab = @driver.find_element(:xpath, '/html/body/span/span/span[1]/input')
    penanggung_jawab.click
    penanggung_jawab.send_keys("HaruQA")
    penanggung_jawab.send_keys :enter
    jatuh_tempo = @driver.find_element(:id, 'jatuh-tempo-invoice')
    jatuh_tempo.click
    jatuh_tempo.send_keys :space
    jatuh_tempo.send_keys :enter
    sleep(3)

    # Click Lunasi Nanti
    lunasi_nanti = @driver.find_element(:id, 'lunasi-nanti')
    if lunasi_nanti.enabled?
      lunasi_nanti.send_keys :enter
      puts "Berhasil klik Lunasi Nanti."
    end

    # Menunggu halaman baru muncul
    @wait_terapkan.until do
      @driver.find_element(:id, "invoice-done")
    end
    sleep(5)

    # Verifikasi halaman baru muncul.
    assertinvoicetersimpan = "Invoice Tersimpan"
    verifikasi_tersimpan = @driver.find_element(:xpath, "//div[@class='f-16 f-bold text-center p-d-4']")
    if verifikasi_tersimpan.text =~ /^#{assertinvoicetersimpan}/
      puts "Wording Invoice_Tersimpan Sudah Sama dan Berhasil mendapatkan halaman baru (Berhasil membuat Invoice baru)."
    else
      puts "Belum berhasil mendapatkan halaman baru."
    end



    kirimnota_button = @driver.find_element(:xpath, "//span[contains(.,'Kirim Nota')]")
    kirimnota_modal = @driver.find_element(:id, "confirm-send")
    if kirim_nota
      if kirimnota_button.displayed?
        kirimnota_button.click
        @wait_terapkan.until do
          kirimnota_modal
        end
        if kirimnota_modal.displayed?
          kirimnota_modal.click
          puts "Berhasil melakukan klik pada modal Kirin Nota WA."
        end

      end
    end

  end

end