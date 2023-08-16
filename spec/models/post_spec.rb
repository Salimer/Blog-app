require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Welcome', author: User.create(name: 'Ali')) }

  before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
end
