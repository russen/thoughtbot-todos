require "spec_helper"

feature "user creates Todo" do

  scenario "successfully with a title" do
    sign_in_as 'person@example.com'

    fill_in 'Title', with: "Buy Milk"
    click_on "Create Todo"

    within 'ul.todos' do
      expect(page).to have_css 'li', text: 'Buy Milk'
    end
  end

end