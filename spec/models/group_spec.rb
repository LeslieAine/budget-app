require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Create Category' do
    before(:each) do
      @user = User.create(id: 1, name: 'Mark', email: 'marcos@gmail.com', password: 'abcdef')
      @user.save
      @group = Group.create(name: 'Electricity', icon: 'https://unsplash.com/photos/oL3-V8xhqlI', user_id: @user.id)
    end

    it 'Should be valid' do
      expect(@group).to be_valid
      @group.save
    end

    it 'Should not be valid if name is not provided' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'Should not be valid if icon url is not provided' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end

    it 'Should belong to the correct user' do
      expect(@group.user_id).to eq @user.id
    end
  end
end
