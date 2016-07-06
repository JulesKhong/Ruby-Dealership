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
end
