class OperationsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get operations_index_url
      assert_response :success
    end
  
    test 'should get new' do
      get operations_new_url
      assert_response :success
    end
  end