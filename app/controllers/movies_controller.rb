class MoviesController < ApplicationController

    get '/movies' do 
        @movies = Movie.all
        # if logged_in?
        #     @movies = current_user.movies 
            erb :'movies/index'
        # else 
        #     redirect '/login'
        # end 
    end

    get '/movies/new' do 
        erb :'movies/new'
    end 

    post '/movies' do 
        @m = current_user.movies.build(title: params[:title], director: params[:director], genre: params[:genre])
        if @m.save 
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
        @movies = Movie.find_by(id: params[:id])
        if @movies
            erb :'/movies/show'
        else 
            redirect '/movies'
        end 
    end 
end
end 
