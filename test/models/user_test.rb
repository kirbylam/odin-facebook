require "test_helper"

class UserTest < ActiveSupport::TestCase
  t_email = 'example@email.com' # test email
  t_fname = 'Bob' # test first name
  t_lname = 'Smith' # test last name
  t_pw = '1234567' # test password

  test "valid user" do
    user = User.new(email: t_email, first_name: t_fname, last_name: t_lname, password: t_pw, password_confirmation: t_pw)
    assert user.valid?
  end

  test 'no email' do
    user = User.new(first_name: t_fname, last_name: t_lname, password: t_pw, password_confirmation: t_pw)
    assert_not user.valid?
  end

  test 'invalid email' do
    user = User.new(email: 'email', first_name: t_fname, last_name: t_lname, password: t_pw, password_confirmation: t_pw)
    assert_not user.valid?
  end

  test 'no first name' do
    user = User.new(email: t_email, last_name: t_lname, password: t_pw, password_confirmation: t_pw)
    assert_not user.valid?
  end

  test 'no last name' do
    user = User.new(email: t_email, first_name: t_fname, password: t_pw, password_confirmation: t_pw)
    assert_not user.valid?
  end

  test 'no password' do
    user = User.new(email: t_email, first_name: t_fname, last_name: t_lname)
    assert_not user.valid?
  end

  test 'short password' do
    user = User.new(email: t_email, first_name: t_fname, last_name: t_lname, password: '1234', password_confirmation: '1234')
    assert_not user.valid?
  end

  test 'incorrect confimation password' do
    user = User.new(email: t_email, first_name: t_fname, last_name: t_lname, password: '1234567', password_confirmation: '23456789')
    assert_not user.valid?
  end

  test 'existing email' do
    user = User.new(email: 'exemail@exemail.com', first_name: t_fname, last_name: t_lname, password: '1234567', password_confirmation: '1234567')
    assert_not user.valid?
  end

  # 
  test 'person1 is person2s friend and vice versa' do
    person1 = users(:user1)
    person2 = users(:user2)
    person1.befriend(person2)
    assert_equal person1.friends.first, person2
    assert_equal person2.friends.first, person1
  end
end
