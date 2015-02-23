require 'rails_helper'

describe 'Valid user can login' do
  scenario "user with valid credentials can login" do
    user = User.create(user_name: 'finn', about: 'nuffin', password: "password")
    visit '/log-in'
    fill_in 'User name', :with => 'finn'
    fill_in "Password", :with => 'password'
    click_on "Sign In"
    expect(page).to have_content('All users')
  end
end
