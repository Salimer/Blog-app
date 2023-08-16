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

    it 'comments_counter should be integer' do
      subject.comments_counter = 'hey'
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be greater than or equal to zero' do
      subject.comments_counter = -2
      expect(subject).to_not be_valid
      subject.comments_counter = 0
      expect(subject).to be_valid
    end

    it 'likes_counter should be integer' do
      subject.likes_counter = 'hey'
      expect(subject).to_not be_valid
    end
end
