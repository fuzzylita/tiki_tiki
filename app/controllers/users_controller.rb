class UsersController < ApplicationController


  get "/users/new" do
    erb :"/users/new.html"
  end

  post '/users' do
    session.clear
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
    session.clear
    @user = User.find_by(email: params["email"])
    if @user && @user.authenticate(params["password"])
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/users/login'
    end
  end

  # GET: /users/:id
  get "/users/:id" do
    if params[:id].to_i == session[:id]
      @user = User.find(params[:id])
      erb :"/users/index.html"
    else
      session.clear
      redirect '/users/login'
    end
  end

  # LOGOUT: /users/5/logout
  get "/users/logout" do
    session.clear
    redirect "/users/login"
  end
end
