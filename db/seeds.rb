default_email = 'changeme@ooju.xyz'
default_password = 'password'

if User.find_by_email(default_email).nil?
  user = User.create!(email: default_email, password: default_password, admin: true)
  Project.create!(user_id: user.id)
end
