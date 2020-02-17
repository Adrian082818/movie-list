class UsersController < ApplicationController


    get '/users' do 
        # if logged_in?
        #     @movies = current_user.movies 
        #     erb :'movies/index'
        # else 
        #     redirect '/login'
        # end 
        @users = User.all 
        erb :"/users/index"
    end 

    # post '/users' do 

    # end 

    get '/signup' do
        erb :"/users/new"
    end
    
      post '/signup' do
    
        user = User.new(params["user"])
    
        if user.save
          session[:user_id] = user.id
          redirect to "/users"
        else
          @errors = user.errors.full_messages
          erb :"/users/new"
        end
      end
    

      get '/users/:id' do
        @users = User.find_by_id(params[:id])
        erb :"/users/show"
      end
    
      get '/users/:id/edit' do
        @users = User.find_by_id(params[:id])
        if @users == current_user
          erb :"/users/edit"
        else
          redirect '/'
        end
      end
    
      patch '/users/:id' do
        @users = User.find_by_id(params[:id])
    
        if @users.update(params[:user])
          redirect to "/users/#{@users.id}"
        else
          erb :"/users/edit"
        end
      end
    
    
      delete '/users/:id' do
        @users = User.find_by_id(params[:id])
        if @users
          @users.destroy
        end
        redirect to "/signup"
      end
    


    # get '/movies/new' do 
    #     erb :'movies/new'
    # end 

    # post '/movies' do 
    #     @movies = Movie.create(title: params[:title], director: params[:director], rating: params[:rating], genre: params[:genre], release_year: params[:release_year])
    #     # @movies = current_user.movies.build(title: params[:title], director: params[:director], rating: params[:rating], genre: params[:genre], release_year: params[:release_year])
    #     if @movies.save
    #         redirect '/movies'
    #     else 
    #         redirect '/movies/new'
    #     end 
    # end 

    # get '/movies/:id' do 
    #     @movies = Movie.find_by(id: params[:id])
    #     if @movies 
    #         erb :'movies/show'
    #     else 
    #         redirect '/movies'
    #     end 
    # end

    # get '/movies/:id/edit' do 
    #     if logged_in?
    #         @movies = Movie.find_by(id: params[:id])
    #         if @movies.user_id == current_user.id 
    #             erb :'movies/edit'
    #         else 
    #             redirect '/movies'
    #         end 
    #     else 
    #         redirect '/login'
    #     end 
    # end 

    # patch '/movies/:id' do 
    #     if logged_in?
    #         @movies = Movie.find_by(id: params[:id])

    #         if @movies.update(title: params[:title], director: params[:director], rating: params[:rating], genre: params[:genre], release_year: params[:release_year])
    #             redirect '/movies'
    #         else 
    #             redirect "/movies/#{@movies.id}/edit"
    #         end 
    #     else 
    #         redirect '/login'
    #     end 
    # end 

    # delete '/movies/:id' do 
    #     if logged_in?
    #         @movies = Movie.find_by(id: params[:id])
    #         if @movies.user_id == current_user.id 
    #             @movies.delete
    #             redirect '/movies'
    #         else 
    #             redirect '/movies'
    #         end 
    #     else 
    #         redirect '/login'
    #     end 
    # end 


end 