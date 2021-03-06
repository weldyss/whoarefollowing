require 'rubygems'
require 'twitter'
require 'sinatra'
require 'haml'

set :public, 'public'

before do
  @username = "whoarefollowing"
  @password = "vitoria"
  http = Twitter::HTTPAuth.new(@username, @password)
  @client = Twitter::Base.new(http)
end

get '/' do
  content_type "text/html", :charset => "utf-8"
  haml :index
end

post '/' do
  content_type "text/html", :charset => "utf-8"
  no_follow = "No, #{params[:are]} didn't are following #{params[:follow]}"
  following = "Yes, #{params[:are]} are following #{params[:follow]}"
  if (params[:are].empty? || params[:follow].empty?)
    @friendship = "Ok, but you need say me both twitter users"
  else
    @friendship = @client.friendship_exists?(params[:are], params[:follow]) ? following : no_follow
  end
  haml :index
end
