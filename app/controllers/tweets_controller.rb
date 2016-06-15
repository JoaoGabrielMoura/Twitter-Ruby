class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user!, only: [:destroy, :edit, :update]

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to @tweet }
        format.js
      end
     else
      render :new
    end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js
    end
  end

  def update
    @tweet = current_user.tweets.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  private
    def tweet_params
      params.require(:tweet).permit(:content)
    end

    def correct_user!
      redirect_to root_path if !current_user.tweet_ids.include? params[:id]
    end
end
