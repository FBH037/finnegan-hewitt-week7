require 'rails_helper'

describe 'users can CRUD Course' do
  scenario 'user can create Course' do
    visit '/courses'
    click_on 'New Course'
    fill_in 'Title', :with => 'joe'
    click_on 'Create Course'
    expect(page).to have_content('joe')
  end
  scenario 'user can view a Course show page' do
    course = Course.create(title: 'finn')
    visit "/courses/#{course.id}"
    expect(page).to have_content('finn')
  end
  scenario 'user can update a Course' do
    course = Course.create(title: 'finn')
    visit "/courses/#{course.id}"
    click_on "Edit"
    fill_in 'Title', :with => 'change'
    click_on "Update Course"
    expect(page).to have_content('change')
  end
  scenario 'user can delete a course' do
    course = Course.create(title: 'finn')
    visit "/courses"
    click_on "Delete"
    expect(page).to have_no_content('finn')
  end
end
