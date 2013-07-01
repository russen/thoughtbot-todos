class TodoOnPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers
  def initialize(title)
    @title = title
  end

  def create
    create_todo_titled @title
  end

  def mark_complete
    todo.click_on "Mark complete"
  end

  def mark_incomplete
    todo.click_on "Mark incomplete"
  end

  def complete?
    todo.has_link? "Mark incomplete"
  end

  def visible?
    within 'ul.todos' do
      any_todos? && todo.visible?
    end
  end

  private

  def any_todos?
      all('li', text: @title).any?
  end

  def todo
    find('li', text: @title)
  end

  def create_todo_titled title
    fill_in 'Title', with: title
    click_on 'Create Todo'
  end
end