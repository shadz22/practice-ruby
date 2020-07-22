users = [
        {username: "shadz", password: "password1"},
        {username: "jamesy", password: "password2"},
        {username: "shirin", password: "password3"}
      ]

def auth_user(username, password, users_list)
  users_list.each do |user| 
    if user[:username] == username && user[:password] == password
      return user
    end
  end
  "Credentials were not correct"
end

attempt = 1
while attempt < 4 
  print "Username: "
  username = gets.chomp
  print "Password: "
  password = gets.chomp
  authentication = auth_user(username, password, users)
  puts authentication
  puts "Press n to exit or any other key to continue"
  input = gets.chomp.downcase
  break if input == 'n'
  attempt += 1
end

puts "You have exceeded the number of attempts" if attempt == 4