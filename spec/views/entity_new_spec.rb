require 'rails_helper'

RSpec.describe 'purchases/new', type: :feature do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Kolly', email: 'kolly@gmail.com', password: 'password', confirmed_at: Time.now)
    icon_file = fixture_file_upload(Rails.root.join('spec', 'support', 'live.png'), 'image/png')
    @group = Group.create!(name: 'Groceries', icon: icon_file, author: @user)
    sign_in @user
    visit new_group_entity_path(@group)
  end

  it 'renders new purchase page' do
    expect(page).to have_content 'ADD Transaction'
  end
  it 'has a form to add new purchase with a field name' do
    expect(page).to have_content 'Name'
  end

  it 'has a form to add new purchase with a field amount' do
    expect(page).to have_content 'Amount'
  end

  it 'has a form to add new purchase with a field groups' do
    expect(page).to have_content 'Groups'
  end
end
