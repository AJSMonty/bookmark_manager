require 'database_connection'

describe DatabaseConnection do

  it 'creates an instance of itself' do
    expect(subject).to be_a DatabaseConnection
  end

  describe '.setup' do
    it 'has a method called setup that takes 1 argument' do
      expect(DatabaseConnection).to respond_to(:setup).with(1).argument
    end
  end

  describe '.query' do
    it 'has a method called query that takes 1 argument' do
      expect(DatabaseConnection).to respond_to(:query).with(1).argument
    end
  end
end