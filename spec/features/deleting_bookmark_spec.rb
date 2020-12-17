feature 'deleting bookmarks' do
    scenario "bookmarks page doesn't display deleted bookmark" do
        Bookmark.create(title: 'BBC', url: 'http://www.bbc.co.uk')
        visit '/bookmarks'
        expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
        first('.bookmark').click_button 'Delete'
        visit '/bookmarks'
        expect(page).not_to have_link('BBC', href: 'http://www.bbc.co.uk')
    end
end
