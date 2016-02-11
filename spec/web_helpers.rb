def sign_up(username: 'marcus', email: 'marcusbullock@hotmail.co.uk',
              password: 'password',
              password_confirmation: 'password')
  visit('/register')
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button('Register')
end
