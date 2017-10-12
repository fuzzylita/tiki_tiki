class UsersController < ApplicationController
  get "/users/new" do
    session.clear
    erb :"/users/new.html"
  end

  post '/users' do
    if Helpers.existing_user?(params["email"])
      return erb :'/users/new_error.html'
    end

    if params['name'].empty? || params['password'].empty? || params['email'].empty?
      return erb :'/users/blank_error.html'
    end

    user = User.create(name: params['name'], email: params['email'], password: params['password'])
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
    session.clear
    @user = User.find_by(email: params["email"])
    if @user && @user.authenticate(params["password"])
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      return erb :'/users/invalid_error.html'
    end
  end

  # LOGOUT: /users/5/logout
  get "/users/logout" do
    session.clear
    redirect "/users/login"
  end

  # GET: /users/:id
  get "/users/:id" do
    if params[:id].to_i == session[:id]
      @user = User.find(params[:id])
      @drinks = @user.drinks.order("lower(name)")
      erb :"/users/index.html"
    else
      session.clear
      redirect '/users/login'
    end
  end

end
