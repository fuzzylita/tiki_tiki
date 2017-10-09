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

    redirect "/users/#{user.username}"
  end


  # GET: /users/login
  get "/users/login" do
    erb :"/users/login.html"
  end

  post '/users/login' do

  end

  # GET: /users/:username
  get "/users/:username" do
    erb :"/users/show.html"
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
