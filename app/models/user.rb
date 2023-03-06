require_relative "friendship"
class User < ApplicationRecord
    has_many :friendships 
    # has_many :friends, through: :friendships

    has_many :friend , class_name: "Friendship", foreign_key: "friend_id"

    def friends
        # str="("
        # self.friendship_ids.each do |id|
        #   # id=Friendship.find_by_sql("select friend_id from friendships where id=#{id}")
        #   #  id=Friendship.find_friend_id(id)
        #   id=Friendship.find (id).friend_id
        #   arr.push(id)
        # end
        arr=[]
        self.friendships.each do |frnd|
          arr.push(frnd.friend_id)
        end

        self.friend.each do |frnd|
          # id=Friendship.find_by_sql("select user_id from friendships where id=#{id}")
          # id=Friendship.find_user_id(id)
          # id=Friendship.find (id).user_id
          arr.push(frnd.user_id)
        end
          str = "("
          size = arr.size-1
          arr.each_with_index do |item, index|
            str=str + item.to_s
            if size!=index
              str=str+","
            end
          end
          str = str + ")"
          User.find_by_sql("select * from users where id in #{str}")
    end 

  end
    # SELECT "users".* FROM "users" INNER JOIN "friendships" ON "users"."id" = "friendships"."friend_id" WHERE "friendships"."user_id" = ?  [["user_id", 1]]         
    

      # def friends1(user)
      #   #  User.find_by_sql("select * FROM users INNER JOIN friendships ON users.id = friendships.user_id where friendships.user_id=#{user.id}")     
      #   User.connection.select_all("select distinct * FROM users INNER JOIN friendships ON users.id = friendships.user_id where friendships.user_id=#{user.id}").to_a
      # end
        #User.joins(:friendships).distinct
        #user    
        #select distinct  users.* FROM (users  JOIN friendships ON users.id = friendships.user_id )JOIN friendships  ON users.id = friendships.friend_id
        #User.joins(:friendships)
        #user.friends )INNER JOIN friendships  ON users.id = friendships.friend_id")
        #end


