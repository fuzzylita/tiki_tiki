class IngredientsController < ApplicationController

  # GET: /ingredients
  get "/ingredients" do
    if Helpers.is_logged_in?(session)
      erb :"/ingredients/index.html"
    else
      redirect '/users/login'
    end
  end

  # GET: /ingredients/new
  get "/ingredients/new" do
    if Helpers.is_logged_in?(session)
      erb :"/ingredients/new.html"
    else
      redirect '/users/login'
    end
  end

  # POST: /ingredients
  post "/ingredients" do
    curr_ings = Ingredient.all.map {|i| i.name.downcase }
    if !curr_ings.include?(params["name"].downcase)
      Ingredient.create(name: params["name"])
      flash[:message] = "#{params["name"]} has been created"
      redirect "/ingredients"
    else
      flash[:message] = "#{params["name"]} already exists"
      redirect "/ingredients"
    end
  end

end
