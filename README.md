# Tiki-Tiki Cocktail Database - Sinatra Portfolio Project

## Overview
A simple, social cocktail database. Once signed up, users can create cocktails and and save them to their personal library. Users can create ingredients, which are added to the communal database and manage their own recipes, as well as view the complete list of recipes for all users. 

## Requirements

- Ruby 2.1 or higher

## Installation
1. [Fork and clone](https://help.github.com/articles/cloning-a-repository/) this repository to your local environment.
2. Install gem dependencies using the following command in your terminal:
```
$ bundle install
```
3. Initialize and seed the database:
```
$ rake db:migrate
$ rake db:seed
```
4. Start the application server:
```
$ shotgun
```
5. Navigate to http://127.0.0.1:9393 to get started.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fuzzylita/tiki_tiki. 

## License

This application is available as open source under the terms of the [MIT License](https://github.com/fuzzylita/tiki_tiki/blob/master/LICENSE).
