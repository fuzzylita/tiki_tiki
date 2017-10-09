class UsersController < ApplicationController


  get "/users/new" do
    erb :"/users/new.html"
  end

  post '/users' do
    if Helpers.existing_user?(params["email"])
      redirect '/users/login'
    end

    if params['username'].empty? || params['password'].empty? || params['email'].empty?
      redirect '/users/new'
    end

    user = User.create(username: params['username'], email: params['email'], password: params['password'])
    session[:id] = user.id

    redirect "/users/#{user.id}"
  end


  # GET: /users/login
  get "/users/login" do
    if Helpers.is_logged_in?(session)
      redirect "/users/#{session[:id]}"
    else
      erb :"/users/login.html"
    end
  end

  post '/users/login' do
    @user = User.find_by(email: params["email"])
    if @user && @user.authenticate(params["password"])
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/users/login'
    end
  end

  # GET: /users/:username
  get "/users/:id" do
    if params[:id].to_i == session[:id]
      @user = User.find(params[:id])
      erb :"/users/index.html"
    else
      session.clear
      redirect '/users/login'
    end
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
