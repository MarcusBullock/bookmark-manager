def sign_up
  visit('/register')
  fill_in :username, with: 'marcus'
  fill_in :email, with: 'marcusbullock@hotmail.co.uk'
  fill_in :password, with: 'Password'
  click_button('Register')
end
