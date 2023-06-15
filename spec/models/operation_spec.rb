require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe 'Create operation' do
    before(:each) do
      @user = User.create(id: 1, name: 'Mark', email: 'marcos@gmail.com', password: 'abcdef')
      @user.save
      @operation = Operation.create(name: 'Heating', amount: 1500, author_id: @user.id)
    end

    it 'Should be valid' do
      expect(@operation).to be_valid
    end

    it 'Should not be valid if amount is less than 0' do
      @operation.amount = -2
      expect(@operation).to_not be_valid
    end
  end
end
