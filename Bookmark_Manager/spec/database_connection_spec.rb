require 'database_connection'

describe '.setup' do
  it 'creates a connection to the database via PG' do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

    DatabaseConnection.setup('bookmark_manager_test')
  end

  it 'the connection is persistent' do
    connection = DatabaseConnection.setup('bookmark_manager_test')

    expect(DatabaseConnection.connection).to eq connection
  end
end

describe '.query' do
  it 'executes a query via PG' do
    connection = DatabaseConnection.setup('bookmark_manager_test')
    expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

    DatabaseConnection.query("SELECT * FROM bookmarks;")
  end
end