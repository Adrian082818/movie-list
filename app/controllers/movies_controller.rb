class MoviesController < ApplicationController

    get '/movies' do 
        # @movies = Movie.all
        # @movies = current_user.movies 
        if logged_in?
        @movies = Movie.all
        # if @movies
            erb :'movies/index'
        else 
            redirect '/login'
        end 
    end

    post '/movies' do 
        # @movies = current_user.movies.create(title: params[:title], director: params[:director], genre: params[:genre])
        @movies = Movie.create(title: params[:title], director: params[:director], genre: params[:genre])
        if @movies.save 
            redirect '/movies'
        else 
            redirect '/movies/new'
        end 
    end 

    get '/movies/:id/edit' do 
        if logged_in?
            @movies = Movie.find_by(id: params[:id])
            if @movies.user_id == current_user.id 
                erb :'movies/edit'
            else 
                redirect '/movies'
            end 
         else redirect '/login'
        end 
    end
    
    delete '/movies/:id' do 
        if logged_in?
            @movies = Movie.find_by(id: params[:id])
            if @movies.user_id == current_user
                @movies.delete 
            else 
                redirect '/movies'
            end 
         else redirect '/login'
        end 
    end 

    patch '/movies/:id' do 
        if logged_in?
            @movies = Movie.find_by(id: params[:id])
            if @movies.update(title: params[:title], director: params[:director], genre: params[:genre])
                redirect '/movies'
            else 
                redirect "/movies/#{@movies.id}/edit"
            end 
         else 
            redirect '/login'
        end 
    end

    get '/movies/:id' do 
        @movies = Movie.find_by_id(params[:id])
        # redirect '/movies/show'
        if @movies
            erb :'/movies/show'
        else 
            redirect '/movies'
        end 
    end 
end
 
