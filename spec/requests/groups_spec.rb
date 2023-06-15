require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /groups' do
    before(:each) do
      @user = User.create(id: 1, name: 'Mark', email: 'marcos@gmail.com', password: 'abcdef')
      @user.save
      sign_in @user
      @group = Group.create(name: 'Electricity', icon: 'https://unsplash.com/photos/oL3-V8xhqlI', user_id: @user.id)
    end

    it 'Should return http success' do
      get groups_path
      expect(response).to have_http_status(:success)
    end

    it 'should render categories/index template' do
      get groups_path
      expect(response).to render_template(:index)
    end

    it 'should render categories/new template' do
      get new_group_path
      expect(response).to render_template(:new)
    end

    it 'should destroy the requested category' do
      expect do
        delete group_path(@group)
      end.to change(Group, :count).by(-1)
    end

    it 'should redirect to categories/index page' do
      delete group_path(@group)
      expect(response).to redirect_to(groups_path)
    end
  end
end
