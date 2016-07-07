require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicles')

get('/') do
  erb(:index)
end

get('/vehicles') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get('/vehicle/new') do
  erb(:vehicles_form)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  color = params.fetch('color')
  engine_size = params.fetch('engine_size')
  number_of_doors = params.fetch('number_of_doors')
  vehicle = Vehicle.new(make, model, year, color, engine_size, number_of_doors)
  # vehicle = Vehicle.new({:make => make, :model => model, :year => year, :color => color, :engine_size => engine_size, :number_of_doors => number_of_doors})
  vehicle.save()
  erb(:success)
end

get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch("id").to_i())
  erb(:vehicle)
end
