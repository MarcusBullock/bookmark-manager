
feature 'Password confirmation' do

  scenario '-> requires password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

end
