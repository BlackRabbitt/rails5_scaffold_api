require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe "#subdomain" do
    it { should validate_presence_of(:subdomain) }
  end
end
