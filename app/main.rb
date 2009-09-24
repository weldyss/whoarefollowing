require 'rubygems'
require 'twitter'
require 'sinatra'
require 'haml'

before do
  @username = "weldyss"
  @password = "$%wcs0108"
  http = Twitter::HTTPAuth.new(@username, @password)
  @client = Twitter::Base.new(http)
end

get '/' do
  content_type "text/html", :charset => "utf-8"
  haml :index
end

post '/' do
  content_type "text/html", :charset => "utf-8"
  @friendship = @client.friendship_exists?(params[:are], params[:follow]) ? "Yes" : "No"
  haml :index
end