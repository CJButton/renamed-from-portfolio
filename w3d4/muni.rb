


# app/models/driver.rb
class Driver
  belongs_to(
    :bus,
    class_name: "Bus",
    foreign_key: :bus_id,
    primary_key: :id
  )
end


# app/models/bus.rb
class Bus
  belongs_to(
    :route,
    class_name: "Route",
    foreign_key: :route_id,
    primary_key: :id,
  )

  has_many(
    :drivers,
    class_name: "Driver",
    foreign_key: :bus_id,
    primary_key: :id,
  )
end


# app/models/route.rb
class Route
  has_many(
    :buses,
    class_name: "Bus",
    foreign_key: :route_id,
    primary_key: :id
  )

  # create a hash with a bus id's as keys and an array of bus drivers as the corresponding
  # value e.g. {'1' => ['Joan Lee', 'Charlie McDonald', 'Kevin Quashie'], '2' => ['Ed Michaels', 'Lisa Frank', Sharla Alegria']}
  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  # still need to work on lower half, where we sift through the query
  # but the part where we call the database seemed pretty okay!
  def better_drivers_query
    all_drivers = {}
    buses = self.buses.include(:drivers)

    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver
      end

      all_drivers[bus.id] = driver.name
  end
end
