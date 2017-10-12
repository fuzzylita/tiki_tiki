class DrinksController < ApplicationController

  # GET: /drinks
  get "/drinks" do
    if Helpers.is_logged_in?(session)
      @drinks= Drink.order("lower(name)")
      erb :"/drinks/index.html"
    else
      redirect '/users/login'
    end
  end

  # GET: /drinks/new
  get "/drinks/new" do
    if Helpers.is_logged_in?(session)
      erb :"/drinks/new.html"
    else
      redirect '/users/login'
    end
  end

  # POST: /drinks
  post "/drinks" do
    @user = User.find_by(id: session[:id])
    if params["drink"]["ingredient_ids"].nil?
      ingredients = []
    else
      ingredients = params["drink"]["ingredient_ids"].map do |i|
        Ingredient.find(i)
      end
    end
    @drink = @user.drinks.create(
      name: params["drink"]["name"],
      instructions: params["drink"]["instructions"],
      ingredients: ingredients
    )
    flash[:message] = "#{params["drink"]["name"]} has been created"
    redirect "/drinks/#{@drink.slug}"
  end

  # GET: /drinks/slug
  get "/drinks/:slug" do
    if Helpers.is_logged_in?(session)
      @drink = Drink.find_by_slug(params[:slug])
      @user = User.find_by(id: session[:id])
      erb :"/drinks/show.html"
    else
      redirect '/users/login'
    end
  end

  # GET: /drinks/slug/edit
  get "/drinks/:slug/edit" do
    if Helpers.is_logged_in?(session)
      @drink = Drink.find_by_slug(params[:slug])
      @user = User.find_by(id: session[:id])
      erb :"/drinks/edit.html"
    else
      redirect '/users/login'
    end
  end

  # PATCH: /drinks/slug
  patch "/drinks/:slug" do
    @drink = Drink.find_by_slug(params[:slug])
    ingredients = params["drink"]["ingredient_ids"].map do |i|
      Ingredient.find(i)
    end

    @drink.update(
      name: params["drink"]["name"],
      instructions: params["drink"]["instructions"],
      ingredients: ingredients
    )
    flash[:message] = "#{params["drink"]["name"]} has been updated"
    redirect "/drinks/#{@drink.slug}"
  end

  # DELETE: /drinks/slug/delete
  delete "/drinks/:slug/delete" do
      drink = Drink.find_by_slug(params[:slug])
      @name = drink.titlecaser
      @user = User.find_by(id: session[:id])
      drink.delete
      erb :"/drinks/deleted.html"
  end
end