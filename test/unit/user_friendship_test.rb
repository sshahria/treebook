require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship work without raising an exception"  do 
		assert_nothing_raised do
			UserFriendship.create user: users(:shervin), friend: users(:mike)
		end
	end

	test "that creating a friendship basedon user id and friend is works" do 
		UserFriendship.create user_id: users(:shervin).id, friend_id: users(:mike).id
		assert users(:shervin).friends.include?(users(:jim))
	end
end
