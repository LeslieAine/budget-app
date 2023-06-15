require 'rails_helper'

RSpec.describe 'Operations', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /operations' do
    before(:each) do
      @user = User.create(id: 1, name: 'Mark', email: 'marcos@gmail.com', password: 'abcdef')
      @user.save
      sign_in @user
      @group = Group.create(id: 2, name: 'Electricity', icon: 'https://unsplash.com/photos/oL3-V8xhqlI',
                            user_id: @user.id)
      @operation = Operation.create(name: 'Heating', amount: 1500, author_id: @user.id, group_ids: [@group.id])
    end

    it 'Should return http success' do
      get group_operations_path(@group)
      expect(response).to have_http_status(:success)
    end

    it 'should render operations/index template' do
      get group_operations_path(@group)
      expect(response).to render_template(:index)
    end

    it 'should render operations/new template' do
      get new_group_operation_path(@group)
      expect(response).to render_template(:new)
    end

    it 'should destroy the given transaction' do
      expect do
        delete group_operation_path(@group, @operation)
      end.to change(Operation, :count).by(-1)
    end
  end
end
