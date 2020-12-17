require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it "returns a list of all saved bookmarks" do
      #Add the test data
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      Bookmark.create(title: 'DAS', url: 'http://www.destroyallsoftware.com')
      Bookmark.create(title: 'Google', url: 'http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

    end
  end

  describe '.create' do
    it 'should add a bookmark to list of saved bookmarks' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'should delete a bookmark from list of bookmarks' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')
      persisted_data = persisted_data(id: bookmark.id)
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'should update a bookmark from list of bookmarks' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')
      Bookmark.update(id: 1, new_title: 'Sport', new_url: 'http://www.blah.com')
      expect(Bookmark.all.first.title).to include('Sport')
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

end
