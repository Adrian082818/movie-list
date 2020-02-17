require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, SecureRandom.hex
    # SecureRandom.hex
  end

  get "/" do
    erb :welcome
  end

  helpers do 

    def logged_in?
      !!current_user 
    end 

    # def login(username, password)
    #   user = User.find_by(username: params[:username], password: params[:password])

    #   if user && user.authenticate(params[:password])
    #     session[:username] = user.username
    #     session[:password] = user.password
    #     session[:user_id] = user.id
    #   else 
    #     redirect '/login'
    #   end 
    # end 

    def current_user
      # @current_user ||= User.find_by(username: session[:username]) if session[:username]
      User.find_by(id: session[:user_id])
    end 

    # def logout 
    # session.clear
    # end 
  end 
end
