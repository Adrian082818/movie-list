class MovieController < ApplicationController


    get '/movies' do 
        if logged_in?
            @movies = current_user.movies 
            erb :'movies/index'
        else 
            redirect '/login'
        end 
    end 

    get '/movies/new' do 
        erb :'movies/new'
    end 

    post '/movies' do 
        @movies = Movie.create(title: params[:title], director: params[:director], rating: params[:rating], release_year: params[:release_year])
        if @movies.save
            redirect '/movies'
        else 
            redirect '/movies/new'
        end 
    end 

    get '/movies/:id' do 
        @movies = Movie.find_by(id: params[:id])
        if @movies 
            erb :'movies/show'
        else 
            redirect '/movies'
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
        else 
            redirect '/login'
        end 
    end 

    patch '/movies/:id' do 
        if logged_in?
            @movies = Movie.find_by(id: params[:id])

            if @movies.update(title: params[:title], director: params[:director], rating: params[:rating], release_year: params[:release_year])
                redirect '/movies'
            else 
                redirect "/movies/#{@movies.id}/edit"
            end 
        else 
            redirect '/login'
        end 
    end 

    delete '/movies/:id' do 
        if logged_in?
            @movies = Movie.find_by(id: params[:id])
            if @movies.user_id == current_user.id 
                @movies.delete
                redirect '/movies'
            else 
                redirect '/movies'
            end 
        else 
            redirect '/login'
        end 
    end 


end 