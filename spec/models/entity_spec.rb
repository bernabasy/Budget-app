require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.new(name: 'berna', password: '123456', email: 'berna@gmail.com')
    @user.save
  end

  subject do
    @Entity = Entity.new(name: 'hammers', amount: 200)
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'the amount should be numerical' do
      subject.amount = 'a'
      expect(subject).to_not be_valid
    end
  end
end
