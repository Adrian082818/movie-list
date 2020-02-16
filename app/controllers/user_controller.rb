class UserController < ApplicationController


    get '/signup' do 
        erb :'users/signup'
    end 

    post '/signup' do 
        @users = User.create(username: params[:username], email: params[:email], password: params[:password])
        if @users.save 
            redirect '/login'
        else 
            redirect '/signup'
        end 
    end 

    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do 
        login(params[:username], params[:password])
        # user = User.find_by(email: params[:user][:email])
        # if user && user.authenticate(params[:user][:password])
        #     session[:user_id] = user.id
        redirect '/movies'
        end 

    get '/logout' do 
        logout 
        redirect '/login'
    end 
end 