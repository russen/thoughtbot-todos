require 'spec_helper'

feature 'User manages todo completions' do
  scenario 'marks todo complete' do
    sign_in_as 'person@example.com'
    todo_on_page = TodoOnPage.new('Buy fruit')
    todo_on_page.create
    todo_on_page.mark_complete
    expect(todo_on_page).to be_complete
  end

  scenario 'marks todo incomplete' do
    sign_in_as 'person@example.com'
    todo_on_page = TodoOnPage.new('Buy fruit')
    todo_on_page.create
    todo_on_page.mark_complete
    todo_on_page.mark_incomplete
    expect(todo_on_page).to_not be_complete
  end
end