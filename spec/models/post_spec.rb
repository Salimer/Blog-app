require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Welcome', author: User.create(name: 'Ali')) }

  before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should be less than 251 chars' do
      subject.title = 'Lorem ipsum dolor sit amet,
      consectetuer adipiscing elit. Aenean commodo ligula
      eget dolor. Aenean massa. Cum sociis natoque penatibus
      et magnis dis parturient montes, nascetur ridiculus mus.
      Donec quam felis, ultricies neln ea' # 251 chars
      expect(subject).to_not be_valid
    end
end
