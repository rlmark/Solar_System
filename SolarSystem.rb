######### INDIVIDUAL PLANET CLASS #########
class Planet
  attr_accessor :name, :mass, :moons, :rings, :inhabitable, :rate_of_rotation

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @mass = planet_hash[:mass]
    @moons = planet_hash[:moons]
    @rings = planet_hash[:rings]
    @inhabitable = planet_hash[:inhabitable]
    @rate_of_rotation = planet_hash[:rate_of_rotation]
  end

end


######### SOLAR SYSTEM CLASS #########
class SolarSystem
  attr_accessor :formation_date, :planets

  def initialize(planets, formation_date)
    @formation_date = formation_date
    @planets = planets
    puts "your solar system is #{@formation_date} years old"
  end

  def return_local_year
    planets.each do |planet|
      planet_year = @formation_date * 365 / planet.rate_of_rotation
      puts "your planet is #{planet_year} years old."
    end

  end
end


######### ARRAY WITH PLANETARY DATA #########
celestial_bodies = [
  {
    name: "Earth",
    mass: "6 * 10^24 kilograms",
    moons: ["Moon"],
    rings: "none",
    inhabitable: "yes",
    rate_of_rotation: 365.0
  },
  {
    name: "Mars",
    mass: "Really really heavy",
    moons: ["Phobos", "Deimos"],
    rings: "none",
    inhabitable: "maybe, martians?",
    rate_of_rotation: 687.0
  },
  {
    name: "Venus",
    mass: "Lighter than earth?",
    moons: "none",
    rings: "none",
    inhabitable: "no, too hot",
    rate_of_rotation: 225.7
  }
]

# Created empty array to feed to solar system as param
planets = []

# This method creates each of the planet objects
celestial_bodies.each do |hash|
  new_planet = Planet.new(hash)
  puts new_planet.name
  puts new_planet.mass
  puts new_planet.moons
  puts new_planet.inhabitable
  puts new_planet.rate_of_rotation
  puts ""
  planets << new_planet
end

# Create a new solar system object, taking an array of planets.
new_solar_system = SolarSystem.new(planets, 4)
# For each of the planets, this should return its year
new_solar_system.return_local_year


######## ASKING FOR USER INPUT ########

# Asking PLANET now
puts "Which Planet would you like to learn about:"
planets.each {|planet| puts planet.name}
print "? > "

# User enters desired planet, assigned here
desired_planet = gets.chomp.downcase

# This checks if user input matches planet name inside planets array
if queried_planet = planets.detect { |planet| planet.name.downcase == desired_planet}
else
  abort"That is not a planet"
end

# Asking WHICH ASPECT now
puts "You have chosen #{queried_planet.name}.
What aspect do you want to learn about (Leave off @ sign)"
puts queried_planet.instance_variables

desired_aspect = gets.chomp.downcase

# Creates an array from instance variables
planetary_array = queried_planet.instance_variables

desired_aspect = ("@#{desired_aspect}")

if planetary_array.include? (desired_aspect.to_sym)
  puts "You selected " +  desired_aspect.gsub("@","")
  if desired_aspect == "@name"
    puts queried_planet.name
  elsif desired_aspect == "@mass"
    puts queried_planet.mass
  elsif desired_aspect == "@moons"
    puts queried_planet.moons
  elsif desired_aspect == "@rings"
    puts queried_planet.rings
  elsif desired_aspect == "@inhabitable"
    puts queried_planet.inhabitable
  else desired_aspect == "@rate_of_rotation"
    puts queried_planet.rate_of_rotation
  end
else
  puts "That's not an attribute"
end
