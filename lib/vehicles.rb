class Vehicle
  attr_reader(:make, :model, :year, :color, :engine_size, :number_of_doors)

  @@vehicles = []

  define_method(:initialize) do |attributes|
    @make = attributes.fetch(:make)
    @model = attributes.fetch(:model)
    @year = attributes.fetch(:year)
    @color = attributes.fetch(:color)
    @engine_size = attributes.fetch(:engine_size)
    @number_of_doors = attributes.fetch(:number_of_doors)
    @id = @@vehicles.length().+(1)
  end

  define_singleton_method(:all) do
    @@vehicles
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end

  define_method(:age) do
    new_time = Time.new()
    new_time.year().-(@year.to_i())
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |identification|
    found_vehicle = nil
    @@vehicles.each() do |vehicle|
      if vehicle.id().eql?(identification.to_i())
        found_vehicle = vehicle
      end
    end
    found_vehicle
  end
end
