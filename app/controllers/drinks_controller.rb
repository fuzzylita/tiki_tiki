class DrinksController < ApplicationController

  # GET: /drinks
  get "/drinks" do
    erb :"/drinks/index.html"
  end

  # GET: /drinks/new
  get "/drinks/new" do
    erb :"/drinks/new.html"
  end

  # POST: /drinks
  post "/drinks" do
    @user = User.find_by(id: session[:id])
    ingredients = params["drink"]["ingredient_ids"].map do |i|
      Ingredient.find(i)
    end
    @drink = @user.drinks.create(
      name: params["drink"]["name"],
      instructions: params["drink"]["instructions"],
      ingredients: ingredients
    )
    redirect "/drinks/#{@drink.slug}"
  end

  # GET: /drinks/slug
  get "/drinks/:slug" do
    @drink = Drink.find_by_slug(params[:slug])
    erb :"/drinks/show.html"
  end

  # GET: /drinks/slug/edit
  get "/drinks/:slug/edit" do
    erb :"/drinks/edit.html"
  end

  # PATCH: /drinks/slug
  patch "/drinks/:slug" do
    redirect "/drinks/:id"
  end

  # DELETE: /drinks/slug/delete
  delete "/drinks/:slug/delete" do
    redirect "/drinks"
  end
end



# params => {
#   drink => {
#     name: 'old-fashioned',
#     instructions: 'stir and drink',
#     ingredients: [id1, id2, id3]
#   }
# }