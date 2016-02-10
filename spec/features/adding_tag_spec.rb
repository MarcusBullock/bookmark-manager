feature 'Adding tags to links' do

  scenario '-> users can add tags to their links' do
    visit('/links/new')
    fill_in('title', with: 'BBC News')
    fill_in('url', with: 'www.bbc.co.uk')
    fill_in('tag', with: 'news')
    click_button('Submit')
    expect(page).to have_content 'Title: BBC News'
    expect(page).to have_content 'URL: www.bbc.co.uk'
    expect(page).to have_content 'Tag: news'
  end

  scenario '-> it can add multiple tags' do
    visit('/links/new')
    fill_in('title', with: 'BBC News')
    fill_in('url', with: 'www.bbc.co.uk')
    fill_in('tag', with: 'news journalism')
    click_button('Submit')
    visit('/tags/news')
    expect(page).to have_content 'Title: BBC News'
    visit('/tags/journalism')
    expect(page).to have_content 'Title: BBC News'
  end

  scenario '-> it adds to the database when adding new links' do 
    visit('/links/new')
    fill_in('title', with: 'BBC News')
    fill_in('url', with: 'www.bbc.co.uk')
    fill_in('tag', with: 'news journalism')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('news', 'journalism')
  end
end
