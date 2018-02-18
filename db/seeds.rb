%w[hugo.peixoto@gmail.com rokusu@gmail.com].each do |email|
  User.create!(email: email, admin: true)
end
