def sign_in(user)
  remember_token = User.new_remember_token
  cookies[:remember_token] = remember_token
  user.update_attribute(:remember_token, User.encrypt(remember_token))
end
