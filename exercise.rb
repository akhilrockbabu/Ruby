require 'sqlite3'

# Open a SQLite 3 database file
db = SQLite3::Database.new "authenticator.db"


def auth_user(username, password, db)
  result = db.execute("SELECT * FROM users WHERE username = ? AND password = ? LIMIT 1", [username, password])
  user_record = result.first
  user_record ? user_record : "Credentials were not correct"
end

puts "Welcome to the authenticator"
25.times { print "-" }
puts
puts "This program will take input from the user and compare password"
puts "If password is correct, you will get back the user object"

attempts = 1
while attempts < 4
  print "Username: "
  username = gets.chomp
  print "Password: "
  password = gets.chomp
  authentication = auth_user(username, password, db)
  puts authentication
  puts "Press q to quit or any other key to continue: "
  input = gets.chomp.downcase
  break if input == "q"
  attempts += 1
end

puts "You have exceeded the number of attempts" if attempts == 4
