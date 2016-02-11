
feature 'Password confirmation' do

  scenario '-> requires password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_current_path('/users')
    expect(page).to have_content('Passwords do not match.')
  end

end
