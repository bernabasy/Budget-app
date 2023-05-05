require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'berna', password: '123456', email: 'berna@gmail.com')
    @user.save
  end

  subject do
    @p = Group.new(name: 'berna', icon: Rack::Test::UploadedFile.new('spec/support/live.png', 'live/png'))
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an icon image' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
