require 'spec_helper'

describe User do

  describe '#signed_in?' do
    it "returns true" do
      user = User.new 'person@example.com'
      expect(user).to be_signed_in
    end
  end

  describe "#display_name" do
    it "returns an email address of the user" do
      user = User.new('person@email.com')
      expect(user.display_name).to eq 'person@email.com'
    end
  end

  describe "#todos" do
    it 'returns todos owned by that user when an admin' do
      todo = Todo.create(owner_email: 'person@example.com')
      other_todo = Todo.create(owner_email: 'someonelse@example.com')
      user = User.new('person@example.com')
      expect(user.todos).to eq [todo]
    end
  end

end