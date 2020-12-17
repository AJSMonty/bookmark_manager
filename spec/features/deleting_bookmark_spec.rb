feature 'deleting bookmarks' do
    scenario "bookmarks page doesn't display deleted bookmark" do
        Bookmark.create('BBC', 'http://www.bbc.co.uk')
        Bookmark.delete('BBC')
        visit '/bookmarks'
        expect(page).not_to have_content 'BBC'
    end
end
