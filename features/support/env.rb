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

#метод для клика на пункт в меню
def select_menu_item(value)
  current_screen= get_source
  previous_screen = ""

  until (exists {find_element(id:"design_navigation_view").find_element(xpath: "//android.widget.CheckedTextView[@text='#{value}']")}) || (previous_screen == current_screen) do
    Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.2, duration: 500).perform
    previous_screen = current_screen
    current_screen = get_source
  end

  if exists {find_element(id:"design_navigation_view").find_element(xpath: "//android.widget.CheckedTextView[@text='#{value}']")}
    find_element(id:"design_navigation_view").find_element(xpath: "//android.widget.CheckedTextView[@text='#{value}']").click
  else
    fail("Element #{value} wasn't found in menu")
  end

end