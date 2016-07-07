require('rspec')
require('vehicles')

describe(Vehicle) do

  describe('#initialize') do
    it('returns the attributes of the vehicle') do
      test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
      expect(test_vehicle.make()).to(eq("Toyota"))
      expect(test_vehicle.model()).to(eq("Prius"))
      expect(test_vehicle.year()).to(eq("2000"))
      expect(test_vehicle.color()).to(eq("blue"))
      expect(test_vehicle.engine_size()).to(eq("4L"))
      expect(test_vehicle.number_of_doors()).to(eq("4"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a vehicle to the array of saved vehicles') do
      test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
      test_vehicle.save()
      expect(Vehicle.all()).to(eq([test_vehicle]))
    end
  end

  describe('.clear') do
    it("empties out all saved vehicles") do
      Vehicle.new({:make => "Toyota", :model => "Prius", :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"}).save()
      Vehicle.clear()
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe('#age') do
    it("returns the age of the vehicle") do
      test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
      expect(test_vehicle.age()).to(eq(16))
    end
  end

  describe('#id') do
    it("returns the id of the vehicle") do
    test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
    test_vehicle.save()
    expect(test_vehicle.id()).to(eq(1))
    end
  end
end
