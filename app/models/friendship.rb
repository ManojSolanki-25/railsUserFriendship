class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend,class_name: 'User'
  # before_save -> { self.check_user_already_friend(user_id: user_id,friend_id: friend_id) }
  
  # def self.find_friend_id(id)
  #   id=Friendship.find_by_sql("select friend_id from friendships where id=#{id}")
  # end

  # def self.find_user_id(id)
  #   id=Friendship.find_by_sql("select user_id from friendships where id=#{id}")
  # end

  # private

  # def self.check_user_already_friend(user_id,friend_id)
  #   user = :user_id => friend_id 
  #   frnd = :friend_id => user_id
  #   user.present? AND frnd.present?
  # end

  # def self.create_friendship(user_id,friend_id)
  #   if self.check_already_friend(user_id,friend_id)
  #     Friendship.create(user_id: user_id,friend_id:friend_id)
  #     Friendship.create(user_id: friend_id,friend_id:user_id)    
  #   else
  #     "Both Are Already friends."
  #   end
  # end

  # def self.check_already_friend(user_id,friend_id)
  #     frnd=Friendship.find_by(user_id:user_id)
  #     frnd1=Friendship.find_by(friend_id:friend_id)
  #     if frnd == frnd1
  #        if frnd.present? && frnd1.present?
  #         "not present"
  #         false
  #        else
  #         true
  #        end
  #     else 
  #       "frnd != frnd1"
  #       false
  #     end
  # end

end
