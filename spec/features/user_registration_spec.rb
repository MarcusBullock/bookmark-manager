feature 'Registering users' do

  scenario '-> lets users register an account' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome marcus')
    expect(User.first.email).to eq('marcusbullock@hotmail.co.uk')
  end
end
