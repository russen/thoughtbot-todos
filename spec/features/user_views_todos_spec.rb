require 'spec_helper'

feature "User views todos" do
  scenario "does not see others todos" do
    Todo.create(title: "Buy eggs", owner_email: 'not_me@example.com')
    sign_in_as 'person@example.com'

    within 'ul.todos' do
      expect(page).to_not have_css 'li', text: 'Buy eggs'
    end

  end
end