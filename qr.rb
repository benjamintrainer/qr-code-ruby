# Write your solution here!
require "rqrcode"

#User Prompt

puts "Whate QR code would you like to make?"
puts
puts "Press number to:"
puts
puts "1. Go to a URL"
puts "2. Download an App"
puts "3. Connect to WiFi"
puts
puts "4. Exit"
puts

pressed_num = gets.chomp

if pressed_num.include?("4")
  puts "Goodbye!"
  exit

elsif pressed_num.include?("1")
  puts "What URL would you like to turn into a QR code"
  text_to_encode = gets.chomp
  
elsif pressed_num.include?("2")
  puts "What app would you like to download?"
  app_to_encode = gets.chomp

elsif pressed_num.include?("3")
  puts "What is the name of the wifi network?"

  network_name = gets.chomp

  puts "What is the password?"

  network_password = gets.chomp

  text_to_encode = "WIFI:T:WPA;S:#{network_name};P:#{network_password};;"
else
  puts "Bye!"
end

puts "What would you like to call the PNG?"
puts

filename = gets.chomp
puts

qrcode = RQRCode::QRCode.new(text_to_encode)

png = qrcode.as_png({ :size => 500 })

IO.binwrite("#{filename}.png", png.to_s)
