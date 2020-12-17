feature 'updating bookmarks' do
    scenario "bookmarks page displays updated bookmark" do
        Bookmark.create(title: 'BBC', url: 'http://www.bbc.co.uk')
        visit '/bookmarks'
        expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
        first('.bookmark').click_button 'Update'
        fill_in('new_title', with: 'Sport')
        fill_in('new_url', with: 'http://www.bbc.co.uk/sport')
        click_button('Update')
        expect(page).not_to have_link('BBC', href: 'http://www.bbc.co.uk')
        expect(page).to have_link('Sport', href: 'http://www.bbc.co.uk/sport')
    end
end
