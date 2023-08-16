require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ali') }

  before { subject.save }

  describe 'validation tests' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
