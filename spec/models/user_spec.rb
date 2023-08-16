require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ali') }

  before { subject.save }

end
