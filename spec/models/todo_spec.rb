require 'spec_helper'

describe Todo, '#complete?' do
  it 'returns true when completed_at is set' do
    todo = Todo.new(completed_at: Time.current)
    expect(todo).to be_complete
  end

  it 'returns false when completed_at is not' do
    todo = Todo.new(completed_at: nil)
    expect(todo).not_to be_complete
  end
end

describe Todo, '#mark_complete' do
  it "should set completed_at" do
    todo = Todo.create
    todo.mark_complete
    expect(todo).to be_complete
  end
end

describe Todo, '#mark_incomplete' do
  it "should unset completed_at" do
    todo = Todo.create(completed_at: Time.now)
    todo.mark_incomplete
    expect(todo).not_to be_complete
  end
end