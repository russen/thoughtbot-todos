require 'spec_helper'

feature "User views todos" do
  scenario "does not see others todos" do
    Todo.create(title: "Buy eggs", owner_email: 'not_me@example.com')
    sign_in_as 'person@example.com'

    todo_on_page = TodoOnPage.new('Buy eggs')

    expect(todo_on_page).to_not be_visible
  end
end