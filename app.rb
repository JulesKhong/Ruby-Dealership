require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicles')

get('/') do
  erb(:index)
end

get('/vehicles') do
  @vehicles = Vehicles.all()
  erb(:vehicles)
end

get('/sell') do
  erb(:sell)
end

post('/success') do
  @make = params.fetch('make')
  @model = params.fetch('model')
  @year = params.fetch('year')
  @color = params.fetch('color')
  @engine_size = params.fetch('engine_size')
  @number_of_doors = params.fetch('number_of_doors')
  erb(:success)
end
