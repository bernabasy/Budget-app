require 'rails_helper'

RSpec.describe 'entities/index', type: :feature do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Kolly', email: 'kolly@gmail.com', password: 'password', confirmed_at: Time.now)
    icon_file = fixture_file_upload(Rails.root.join('spec', 'support', 'live.png'), 'image/png')
    @group = Group.create!(name: 'Groceries', icon: icon_file, author: @user)
    sign_in @user
    visit group_entities_path(@group)
  end

  it 'renders new purchase page' do
    expect(page).to have_content 'Transaction'
  end

  it 'has a link to add new purchase' do
    expect(page).to have_content 'Add new Purchase'
  end
end
