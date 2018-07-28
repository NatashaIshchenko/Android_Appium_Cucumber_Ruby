require "appium_lib"

#объявляем capabilities
def caps
  { caps: {
      deviceName: "Name",
      platformName: "Android",
      app: (File.join(File.dirname(__FILE__), "ultimate_converter.apk")),
      appPackage: "com.physphil.android.unitconverterultimate",
      appActivity: "com.physphil.android.unitconverterultimate.MainActivity",
      newCommandTimeout: "3600"
  }}
end

#подключение драйвера к ruby
Appium::Driver.new(caps, true) #передаем capabilities
Appium.promote_appium_methods Object #делаем доступными методы Аппиума в нашем IDE