require "test_helper"

class PostTest < ActiveSupport::TestCase
  test 'valid post' do
    post = Post.new(body: 'This is a test case')
    post.author = users(:user1)
    assert post.valid?
  end

  test 'likes is set to 0' do
    post = Post.new(body: 'This is another test')
    post.author = users(:user2)
    post.save
    assert_equal 0, post.likes
  end

  test 'cant create post w/o body' do
    post = Post.new()
    post.author = users(:user1)
    assert_not post.valid?
  end
end
