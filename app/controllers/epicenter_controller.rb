class EpicenterController < ApplicationController
  
  before_action :authenticate_user!


  def feed
    @following_tweets = Tweet.where(user_id: current_user.following.push(current_user.id))
                          .order(created_at: :desc)
    @users = User.all
  end

  def show_user
  	@user = User.find(params[:id])
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

end
