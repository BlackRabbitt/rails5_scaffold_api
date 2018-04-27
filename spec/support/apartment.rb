RSpec.configure do |config|
  config.before(:suite) do
    # Truncating doesn't drop schemas, ensure we're clean here, app *may not* exist
    Apartment::Tenant.drop('tapp') rescue nil
    # Create the default tenant for our tests
    FactoryBot.create(:organization, subdomain: "tapp")
  end

  config.before(:each) do
    # Switch into the default tenant
    Apartment::Tenant.switch! 'tapp'
  end

  config.after(:each) do
    # Reset tentant back to `public`
    Apartment::Tenant.reset
  end
end
