require 'database_connection'

describe DatabaseConnection do

  it 'creates an instance of itself' do
    expect(subject).to be_a DatabaseConnection
  end

  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'has a method called query that takes 1 argument' do
      expect(DatabaseConnection).to respond_to(:query).with(1).argument
    end
  end
end