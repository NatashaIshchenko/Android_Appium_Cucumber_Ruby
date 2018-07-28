Before do
  puts("Before scenario")
  #запускаем драйвер Аппиума
  $driver.start_driver
end

After do
  puts("After scenario")
  #убиваем драйвер Аппиума
  $driver.driver_quit
end