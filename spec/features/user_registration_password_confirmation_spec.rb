
feature 'Password confirmation' do

  scenario '-> requires password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_current_path('/register')
    expect(page).to have_content('Wrong')
  end

end
