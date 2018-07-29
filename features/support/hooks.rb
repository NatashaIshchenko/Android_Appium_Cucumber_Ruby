Before do
  puts("Before hooks")
  #запускаем драйвер Аппиума
  $driver.start_driver
end

After do
  puts("After hooks")
  #убиваем драйвер Аппиума
  $driver.driver_quit
end