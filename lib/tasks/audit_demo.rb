#print "Hello world"
system("rails c --sandbox")
user = User.create(username:"test", password:"test", password_confirmation:"test")
user.audits.last