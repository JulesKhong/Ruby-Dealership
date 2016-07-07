require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')
require('pry')

get('/') do
  erb(:index)
end
# SHOW ME THE ADD DEALERSHIP FORM
get('/dealerships/new') do
  erb(:dealership_form)
end
# SHOW ME ALL DEALERSHIPS
get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end
# ADD A DEALERSHIP TO THE LIST
post('/dealerships') do
  name = params.fetch('name')
  Dealership.new(name).save()
  @dealerships = Dealership.all()
  erb(:success)
end
# GET THE VEHICLE ID
get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch("id").to_i())
  erb(:vehicle)
end
# GET THE DEALERSHIP ID
get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end
# GET FORM TO ADD A VEHICLE TO A DEALERSHIP
get('/dealerships/:id/vehicles/new') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership_vehicles_form)
end

get('vehicle') do
  @vehicle = Vehicle.find(params.fetch(''))
  erb(:vehicle)
end

# get('/vehicles') do
#   @vehicles = Vehicle.all()
#   erb(:vehicles)
# end
#
# get('/vehicle/new') do
#   erb(:vehicles_form)
# end
# POST A VEHICLE
post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  color = params.fetch('color')
  engine_size = params.fetch('engine_size')
  number_of_doors = params.fetch('number_of_doors')
  @vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
  @vehicle.save()
  Vehicle.clear()
  @dealership = Dealership.find(params.fetch('dealership_id').to_i())
  @dealership.add_vehicle(@vehicle)
  erb(:success)
end
