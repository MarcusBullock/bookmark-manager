feature 'Email requirement' do

  scenario '-> user is required to supply an email to register' do
    expect{sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario '-> requires a genuine email address' do
    expect{sign_up(email: 'kebab@kebab')}.not_to change(User, :count)
  end
end
