RSpec.configure do |config|
  config.before(:suite) do
    # Clean all tables to start
    DatabaseCleaner.clean_with :truncation
    # Use transactions for tests
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    # Start transaction for this test
    DatabaseCleaner.start
  end

  config.after(:each) do
    # Rollback transaction
    DatabaseCleaner.clean
  end
end
