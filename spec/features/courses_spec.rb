require 'rails_helper'

describe 'users can CRUD Course' do
  scenario 'user can create Course' do
    user = User.create(user_name: 'finn', about: 'nuffin', password: "password")
    visit '/log-in'
    fill_in 'User name', :with => 'finn'
    fill_in "Password", :with => 'password'
    click_on "Sign In"
    click_on 'Courses'
    click_on 'New Course'
    fill_in 'Title', :with => 'joe'
    check 'Is this course at night?'
    click_on 'Create Course'
    expect(page).to have_content('joe')
  end
  scenario 'user can view a Course show page' do
    user = User.create(user_name: 'finn', about: 'nuffin', password: "password")
    visit '/log-in'
    fill_in 'User name', :with => 'finn'
    fill_in "Password", :with => 'password'
    click_on "Sign In"
    course = Course.create(title: 'finn', day_night: true)
    click_on "Courses"
    click_on "finn"
    expect(page).to have_content('finn')
  end
  scenario 'user can update a Course' do
    user = User.create(user_name: 'finn', about: 'nuffin', password: "password")
    visit '/log-in'
    fill_in 'User name', :with => 'finn'
    fill_in "Password", :with => 'password'
    click_on "Sign In"
    course = Course.create(title: 'finn', day_night: true)
    visit "/courses/#{course.id}"
    click_on "Edit"
    fill_in 'Title', :with => 'change'
    click_on "Update Course"
    expect(page).to have_content('change')
  end
  scenario 'user can delete a course' do
    user = User.create(user_name: 'finn', about: 'nuffin', password: "password")
    visit '/log-in'
    fill_in 'User name', :with => 'finn'
    fill_in "Password", :with => 'password'
    click_on "Sign In"
    course = Course.create(title: 'finn', day_night: true)
    visit "/courses"
    click_on "Delete"
    expect(page).to have_no_content('finn')
  end
end
