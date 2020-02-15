class UserController < ApplicationController


    get '/signup' do 
        erb :'users/signup'
    end 

    post '/signup' do 
        @users = User.create(username: params[:username], password: params[:password])
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
        redirect '/movies'
    end 

    get '/logout' do 
        logout 
        redirect '/login'
    end 
end 