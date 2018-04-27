require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#label" do
    it { should have_and_belong_to_many(:roles)}
  end
end
