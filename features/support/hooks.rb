Before do
  puts("Before hook")
  #запускаем драйвер Аппиума
  $driver.start_driver
end

After do |scenario|
  puts("After hook")
  #создание скриншота, при падении
  if scenario.failed?

    if !File.directory?("screenshots") #создание папки screenshots, если ее нет
      FileUtils.mkdir_p("screenshots")
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_file = File.join("screenshots", time_stamp + ".png")
    $driver.screenshot(screenshot_file)
    embed("#{screenshot_file}", "image/png") #встраивание скриншота в отчет
  end

  #убиваем драйвер Аппиума
  $driver.driver_quit
end

AfterConfiguration do
  puts("AfterConfiguration hook")
  if File.directory?("screenshots")
    FileUtils.rm_r("screenshots") #удаление папки screenshots
  end
end