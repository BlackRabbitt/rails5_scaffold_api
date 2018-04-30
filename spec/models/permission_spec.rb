require 'rails_helper'

RSpec.describe Permission, type: :model do
  describe "#roles" do
    it { should have_and_belong_to_many(:roles) }
  end
end
