tiki = User.create(name: "Tiki", email: "tiki@tiki.com", password: "bananas")
lita = User.create(name: "Lita", email: "lita@tiki.com", password: "bananas")

coffee = Drink.create(name: "coffee", instructions: "pour 8 oz into a cup")
banana_old_fashioned = Drink.create(name: "banana old-fashioned", instructions: "stir 2 oz rum, 1 oz banana, 2 dash bitters. Strain and serve over ice")
painkiller = Drink.create(name: "painkiller", instructions: "pour as much as you want over ice and be happy")

rum = Ingredient.create(name: "rum")
banana = Ingredient.create(name: "banana liqueur")
bitters = Ingredient.create(name: "bitters")
beans = Ingredient.create(name: "coffee")
coconut = Ingredient.create(name: "coconut")

tiki.drinks << painkiller
tiki.drinks << banana_old_fashioned
lita.drinks << coffee

painkiller.ingredients << rum
painkiller.ingredients << coconut
painkiller.ingredients << banana
painkiller.save

banana_old_fashioned.ingredients << rum
banana_old_fashioned.ingredients << banana
banana_old_fashioned.ingredients << bitters
banana_old_fashioned.save

coffee.ingredients << beans
coffee.save