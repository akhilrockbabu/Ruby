# users array where username and password are stored
users = [
 { username: "akhil", password: "password1" },
 { username: "albert", password: "password2" },
 { username: "frestin", password: "password3" },
 { username: "nivin", password: "password4" },
 { username: "joseph", password: "password5" }
 ]



# authentication method to check and verify if username/password combination exists
def auth_user(username, password, list_of_users)
    list_of_users.each do |user_record|
        if user_record[:username] == username && user_record[:password] == password
            return user_record
        end
    end
    return "Credentials were not correct"
end



# program execution flow
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
    authentication = auth_user(username, password, users)
    puts authentication
    puts "Press q to quit or any other key to continue: "
    input = gets.chomp.downcase
    if input == "q"
        break
    end
    attempts += 1
end
puts "You have exceeded the number of attempts" if attempts == 4
