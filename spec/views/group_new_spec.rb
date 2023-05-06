require 'rails_helper'

RSpec.describe 'groups/new', type: :feature do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @group = Group.create(name: 'Groceries', author: @user)
    @entity = Entity.create(name: 'Milk', amount: 10, author: @user)
    @group.entities << @entity
    sign_in @user
    visit new_group_path
  end

  it 'renders new group page' do
    expect(page).to have_content 'Name'
  end

  it 'renders new group page' do
    expect(page).to have_content 'Icon'
  end

  it 'renders new group page' do
    expect(page).to have_content 'ADD CATEGORY'
  end

  it 'fills form and clicks on submit' do
    fill_in 'group[name]', with: 'Vegetables'
    find("input[type='submit']").click
    sleep 1
    expect(current_path).to eql '/groups'
  end
end
