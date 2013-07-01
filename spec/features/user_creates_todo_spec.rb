require "spec_helper"

feature "user creates Todo" do

  scenario "successfully with a title" do
    sign_in_as 'person@example.com'

    todo_on_page = TodoOnPage.new('Buy Milk')
    todo_on_page.create

    expect(todo_on_page).to be_visible
  end

end