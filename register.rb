require 'sqlite3'

# Open a SQLite 3 database file
db = SQLite3::Database.new "authenticator.db"

# Create a users table if it doesn't exist
db.execute <<-SQL
  create table if not exists users (
    id integer primary key autoincrement,
    username varchar(30),
    password varchar(30)
  );
SQL

puts "Register a new user"
print "Username: "
username = gets.chomp
print "Password: "
password = gets.chomp

# Insert the new user into the users table
db.execute("INSERT INTO users (username, password) VALUES (?, ?)", [username, password])

puts "User registered successfully!"