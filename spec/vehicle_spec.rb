require('rspec')
require('vehicles')

describe(Vehicle) do

  describe('#make') do
    it('returns the make of the vehicle') do
      test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
      expect(test_vehicle.make()).to(eq("Toyota"))
      expect(test_vehicle.model()).to(eq("Prius"))
      expect(test_vehicle.year()).to(eq("2000"))
      expect(test_vehicle.color()).to(eq("blue"))
      expect(test_vehicle.engine_size()).to(eq("4L"))
      expect(test_vehicle.number_of_doors()).to(eq("4"))
    end
  end
end
