class UsersController < ApplicationController

        # get '/users' do 
        #     @users =  User.all 
        #     erb :"/users/login"
        # end 

        get '/signup' do 
            erb :"/users/signup"
        end 

        post '/signup' do 
            @user = User.new(params["user"])
            @user.username = params[:username]
            @user.password = params[:password]
            if @user.save
                redirect '/login'
            else 
                # @errors = user.errors.full_messages
                redirect '/users/signup'
            end 
        end

        get '/users/:id' do 
            @users = User.find_by(id: params[:id]) 
            if @users 
                erb :'/movies/new'
            else 
            redirect '/movies/show'
            end 
        end 

        get '/login' do 
            erb :"/users/login"
        end 

        post '/login' do 
            user = User.find_by(username: params[:user][:username])
            if user && user.authenticate(params[:user][:password])
                session[:user_id] = user.id 
                redirect "/users/#{user.id}"
                # redirect '/movies'
            else 
                flash[:message] = "Please try again!"
                redirect '/login'
            end 
        end 

        get '/logout' do 
            logout 
            redirect '/'
        end 
        
        # get '/users/:id/edit' do 
        #     @users = User.find_by_id(params[:id])
        #     if @users == current_user 
        #         erb :"/users/edit"
        #     else 
        #         redirect '/'
        #     end 
        # end 

        # patch '/users/:id' do 
        #     @users = User.find_by_id(params[:id])
        #     if @users.update(params[:user])
        #         redirect "/users/#{@users.id}"
        #     else 
        #         erb :"/users/edit"
        #     end 
        # end 

        # delete '/users/:id' do 
        #     @users = User.find_by_id(params[:id])
        #     if @users 
        #         @user.destroy 
        #     end 
        #     redirect "/users"
        # end 
         
end 