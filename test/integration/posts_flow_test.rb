require "test_helper"

class PostsFlowTest < ActionDispatch::IntegrationTest
  test 'can see root page (post index)' do
    get '/'
    assert_select 'h1', 'Timeline'
  end
end
