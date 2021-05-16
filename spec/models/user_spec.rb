require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('valid@email.com').for(:email) }
    it { is_expected.to_not allow_value('invalid.com').for(:email) }
  end
end
