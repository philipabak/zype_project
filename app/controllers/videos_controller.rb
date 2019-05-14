require 'net/http'

class VideosController < ApplicationController
  before_action
  before_action :set_video, only: [:show, :login]

  def index
    api_url = "https://api.zype.com/videos?app_key=#{ENV['APP_KEY']}"
    res = api_get(api_url)
    @videos = res['response']
    @pagination = res['pagination']
  end

  def show
  end

  def login
    api_url = "https://login.zype.com/oauth/token/?grant_type=password"
    res = api_login(api_url)
    @access_token = res['access_token']
    if @access_token
      flash.now[:success] = "You are successfully logged in."
    else
      flash.now[:error] = "You failed to login, please try again."
    end
    render 'show'
  end

  def set_video
    api_url = "https://api.zype.com/videos/#{params[:id]}?app_key=#{ENV['APP_KEY']}"
    res = api_get(api_url)
    @video = res['response']
  end

  private

  def api_get(url)
    uri = URI(url)
    res = Net::HTTP.get(uri)
    JSON.parse(res)
  end

  def api_login(url)
    uri = URI(url)
    res = Net::HTTP.post_form(
        uri,
        'client_id' => ENV['CLIENT_ID'],
        'client_secret' => ENV['CLIENT_SECRET'],
        'username' => params[:username],
        'password' => params[:password]
    )
    JSON.parse(res.body)
  end
end
