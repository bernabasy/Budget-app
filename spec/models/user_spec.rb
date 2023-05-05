require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
 User.new(name: 'berna', password: '123456', email: 'berna@gmail.com')
  end

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'berna'
    expect(subject).to be_valid
  end
end