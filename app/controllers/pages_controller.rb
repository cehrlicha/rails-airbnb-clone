class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @friends = Friend.all
    @sorted_friends = rank_by_rating(@friends)
  end

  def result
    if !params.nil? && !params.empty?
      @friends = Friend.search(params)
    end
  end

  def rank_by_rating(friends)
    ratings_array = []
    sorted_friend_array = []
    friends.each do |friend|
      if friend.average_friend_rating == "no av rating"
        temp_rating = 0
      else
        temp_rating = friend.average_friend_rating
      end
      ratings_array << [temp_rating, friend]

    end
    sorted = ratings_array.sort {|a,b| b[0] <=> a[0]}
    sorted.each do |sort|
      sorted_friend_array << sort[1]
    end
    return sorted_friend_array
  end

end
