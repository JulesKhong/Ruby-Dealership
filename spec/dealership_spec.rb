require('rspec')
require('dealership')
require('vehicle')

describe(Dealership) do
  before() do
    Dealership.clear()
  end

  describe('#name') do
    it('returns the nane if te dealership') do
      test_dealership = Dealership.new("Julia's Junkers")
      expect(test_dealership.name()).to(eq("Julia's Junkers"))
    end
  end

  describe('#id') do
    it('returns the id of the dealership') do
      test_dealership = Dealership.new("Matt's Metal-heap")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it("initially returns an empty array of cars for the dealership") do
      test_dealership = Dealership.new("Matt's Metal-heap")
      expect(test_dealership.cars()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a dealership to the array of dealerships') do
      test_dealership = Dealership.new("Julia's Exploding Hoverboards")
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end
  describe('.all') do
    it('is empty at first') do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties out all of the save dealerships') do
      Dealership.new("Julia's Exploding Hoverboards").save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a dealership by its id number') do
      test_dealership = Dealership.new("Matt's Moving Vans")
      test_dealership.save()
      test_dealership2 = Dealership.new("Julia's Jelopies")
      test_dealership2.save()
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end

  describe('#add_vehicle') do
    it("adds a new vehicle to a dealership") do
      test_dealership = Dealership.new("Matt's Moving Vans")
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end
end