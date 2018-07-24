class EpicenterController < ApplicationController
  
  before_action :authenticate_user!
  # user a symbol name of a method
  before_action :set_user, only: [:show_user, :following, :followers]


  def feed
    @following_tweets = Tweet.where(user_id: current_user.following.push(current_user.id))
                          .order(created_at: :desc)
    @users = User.all
  end

  def show_user
  end

  def all_users
    @users = User.all
  end

  def following
    @users = User.where(id: @user.following)
  end

  def followers
    @users = []

    User.all.each do |u|
      @users.push(u) if u.following.include?(@user.id)

    end
  end

  def now_following
  	current_user.following.push(params[:id].to_i)
  	current_user.save
  	redirect_to show_user_path(id: params[:id])
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save
  	redirect_to show_user_path(id: params[:id])
  end

  def tag_tweets
    @tag = Tag.find(params[:id])
  end

  private

  def set_user
        @user = User.find(params[:id])
  end

end
