class SessionsController < ApplicationController


    # get '/login' do 
    #     erb :"/sessions/new"
    # end 

    # post '/login' do 
    #     user = User.find_by(email: params[:user][:email])

    #     if user && user.authenticate(params[:user][:password])
    #         session[:user_id] = user.id 
    #         redirect to "/users/#{user.id}"
    #     else 
    #         redirect to "/signup"
    #     end 
    # end 

    # post '/logout' do 
    #     session.clear 
    #     redirect to '/login'
    # end 

    get '/movies' do 
        if logged_in?
            # @movies = current_user.movies 
            erb :'movies/index'
        else 
            redirect to '/login'
        end 
    end 

    get '/movies/new' do 
        if logged_in?
        erb :'movies/new'
        else 
            redirect to '/login'
    end 
end 

    post '/movies' do 
        @movies = Movie.new(params[:movie])
        if @movies.save
            redirect to '/movies'
        else 
            redirect to '/movies/new'
        end 
    end 

    get '/movies/:id/edit' do 
        if logged_in?
            @movies = Movie.find_by(id: params[:id])
            # if @movies.user_id == current_user.id
            erb :'/movies/edit'   
            else 
                redirect to '/movies' 
            end 
        # else 
        #     redirect to '/login'
        # # end 
    end 

    patch '/movies/:id' do 
        # if logged_in?
            @movies = Movie.find_by(id: params[:id])
            if @movies.update(title: params[:title], director: params[:director], rating: params[:rating], genre: params[:genre], release_year: params[:release_year])
                redirect to '/movies'
            else 
                redirect to "/movies/#{@movies.id}/edit"
            end 
        # else 
        #     redirect to '/login'
        # # end 
    end 

    delete '/movies/:id' do 
        # if logged_in?
            @movies = Movie.find_by(id: params[:id])
        #    if @movies.user_id == current_user.id 
           if @movies.delete
            redirect to '/movies'
           else 
            redirect to "/movies/#{@movies.id}"
           end 
        # else 
        #     redirect to '/login'
        # # end 
    end 

    get '/movies/:id' do 
        if logged_in?
        @movies = Movie.find_by(id: params[:id])
        if @movies
            erb :'/movies/show'
        else 
            redirect to '/movies'
        end 
        end 
    end 


    # get '/movies' do
    #     if logged_in?
    #         @movies = current_user.movies

    #         erb :'movies/index'
    #     else
    #         redirect '/login'
    #     end
    # end

    # get '/movies/new' do
    #     erb :'movies/new'
    # end

    # post '/movies' do
    #     @movies = current_user.movies.build(title: params[:title], 
    #                                   director: params[:director], 
    #                                   rating: params[:rating], 
    #                                   genre: params[:genre], release_year: params[:release_year])

    #     if @movies.save
    #         redirect '/movies'
    #     else
    #         redirect '/movies/new'
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

    # patch '/movies/:id' do
    #     if logged_in?
    #         @movies = Movie.find_by(id: params[:id])

    #         if @movies.update(title: params[:title], publisher: params[:publisher], year_released: params[:year_released], rating: params[:rating])
    #             redirect "/movies"
    #         else
    #             redirect "/movies/#{@movies.id}/edit"
    #         end
    #     else
    #         redirect '/login'
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
end 