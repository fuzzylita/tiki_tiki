class IngredientsController < ApplicationController

  # GET: /ingredients
  get "/ingredients" do
    erb :"/ingredients/index.html"
  end

  # GET: /ingredients/new
  get "/ingredients/new" do
    erb :"/ingredients/new.html"
  end

  # POST: /ingredients
  post "/ingredients" do
    Ingredient.create(name: params["name"])
    redirect "/ingredients"
  end

end
