
require 'httparty'
require 'awesome_print'


auth = { username: ENV['API_USERNAME'], password: ENV['API_PASSWORD'] }



def get_yarn_list(brand, auth)
  response = HTTParty.get("https://api.ravelry.com/yarns/search.json?query=#{brand}", basic_auth: auth)
  last_page = response["paginator"]["last_page"]
  yarn_list = []
  for page in 1..last_page 
    response = HTTParty.get("https://api.ravelry.com/yarns/search.json?query=#{brand}&page=#{page}", basic_auth: auth)
    response_body = JSON.parse(response.body)
    puts "metodo 1 #{page}-#{brand}"
    yarn_ids = response_body.fetch('yarns').map { |i| i['id'] }
    if !yarn_ids.empty?
      yarn_list << get_yarns(yarn_ids, auth)
    end
    puts "Sleeping for 5 secs"
    sleep(5)
  end
  return yarn_list
end

def get_yarns(yarn_ids, auth)
  list = []
  response = HTTParty.get("https://api.ravelry.com/yarns.json?ids=#{yarn_ids.join('+')}", basic_auth: auth)
  response_body = JSON.parse(response.body)
  puts "metodo 2"
  response_body.fetch('yarns').map { |_k, v| list << v }
  list
end

YARN_BRANDS = %w[garnstudio fios%20pingouin filcolana circulo sandnesgarn hjertegarn].freeze
yarn_list = YARN_BRANDS.map { |brand| get_yarn_list(brand, auth) }.flatten!
# ap yarn_list.first
Message.destroy_all
Chatroom.destroy_all
Favourite.destroy_all
# YarnMaterial.destroy_all
# Yarn.destroy_all
# Brand.destroy_all


count = 0
yarn_list.each do |yarn_data|
#   # AQUI VAI A LÓGICA PARA CRIAR O YARN E O QUE MAIS QUISEREM. O yarn_list é uma lista de hashs

#   # create yarn with materials
  brand_name = yarn_data["yarn_company"]["name"]
  brand = Brand.find_or_create_by(name: brand_name)
  needles = yarn_data["min_needle_size"]["metric"] if yarn_data["min_needle_size"]
  weight = yarn_data['yarn_weight']['name'] if yarn_data['yarn_weight']
  discontinued = yarn_data['discontinued']
  image_url = yarn_data['photos'][0]['medium_url'] if yarn_data['photos'][0]
  next if Yarn.find_by(name: yarn_data['name'], brand: brand).present?
  yarn = Yarn.new(
    name: yarn_data['name'],
    needles: needles,
    brand: brand,
    gauge: yarn_data['min_gauge'],
    weight: weight,
    discontinued: discontinued,
    image_url: image_url
  )
  # create materials
  yarn_data['yarn_fibers'].each do |fiber|
    material = Material.find_or_create_by(
      percentage: fiber['percentage'],
      fiber_type: fiber["fiber_type"]["name"]

    )
    yarn.materials << material
    puts "OK: material #{material.id} - #{material.fiber_type} created"
  end


  yarn.save!
  puts "OK: yarn #{yarn.id} - #{yarn.name} created"
 count += 1
end
puts "Created #{count} yarns."

#setting locations for brands
garnstudio = Brand.where(name: "Garnstudio")
garnstudio.update(location: "Europe")

sandnesgarn = Brand.where(name: "Sandnes Garn")
sandnesgarn.update(location: "Europe")

filcolana = Brand.where(name: "Filcolana")
filcolana.update(location: "Europe")

circulo = Brand.where(name: "Circulo Yarns")
circulo.update(location: "South America")

pingouin = Brand.where(name: "Fios Pingouin")
pingouin.update(location: "South America")

hjertegarn = Brand.where(name: "Hjertegarn")
hjertegarn.update(location: "Europe")

# creating users
User.destroy_all

puts 'Creating user...'

johndoe = User.new(
  email: "john@doe.com",
  password: "123456",
  username: "johnny"
  )
johndoe.save!

maryjane = User.new(
  email: "mary@jane.com",
  password: "123456",
  username: "marjo"
  )
maryjane.save!

puts 'Finished!'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# auth = { username: ENV['API_USERNAME'], password: ENV['API_PASSWORD'] }
# result = HTTParty.get("https://api.ravelry.com/yarns/search.json?query=garnstudio", basic_auth: auth)
# result = JSON.parse(result.body)
# ap result


# garnstudio_response = HTTParty.get("https://api.ravelry.com/yarns/search.json?query=garnstudio", basic_auth: auth)
# garnstudio = JSON.parse(garnstudio_response.body)
# garnstudio_yarn_ids = garnstudio['yarns'].map{|i| i['id']}

# fiospingouin_response = HTTParty.get("https://api.ravelry.com/yarns/search.json?query=fios%20pingouin", basic_auth: auth)
# fiospingouin = JSON.parse(fiospingouin_response.body)
# fiospingouin_yarn_ids = fiospingouin['yarns'].map{|i| i['id']}

# filcolana_response = HTTParty.get("https://api.ravelry.com/yarns/search.json?query=filcolana", basic_auth: auth)
# filcolana = JSON.parse(filcolana_response.body)
# filcolana_yarn_ids = filcolana['yarns'].map{|i| i['id']}

# circulo_response = HTTParty.get("https://api.ravelry.com/yarns/search.json?query=circulo", basic_auth: auth)
# circulo = JSON.parse(circulo_response.body)
# circulo_yarn_ids = circulo['yarns'].map{|i| i['id']}

# sandnesgarn_response = HTTParty.get("https://api.ravelry.com/yarns/search.json?query=sandnesgarn", basic_auth: auth)
# sandnesgarn = JSON.parse(sandnesgarn_response.body)
# sandnesgarn_yarn_ids = sandnesgarn['yarns'].map{|i| i['id']}

# ap garnstudio_yarn_ids.count
# ap fiospingouin_yarn_ids.count
# ap filcolana_yarn_ids.count
# ap circulo_yarn_ids.count
# ap sandnesgarn_yarn_ids.count

# list = []
# garnstudio_result = HTTParty.get("https://api.ravelry.com/yarns.json?ids=#{garnstudio_yarn_ids.join('+')}", basic_auth: auth)
# garnstudio_result["yarns"].map{|k, v| list << v}

# fiospingouin_result = HTTParty.get("https://api.ravelry.com/yarns.json?ids=#{fiospingouin_yarn_ids.join('+')}", basic_auth: auth)
# fiospingouin_result["yarns"].map{|k, v| list << v}

# fiospingouin_result = HTTParty.get("https://api.ravelry.com/yarns.json?ids=#{fiospingouin_yarn_ids.join('+')}", basic_auth: auth)
# fiospingouin_result["yarns"].map{|k, v| list << v}

# circulo_result = HTTParty.get("https://api.ravelry.com/yarns.json?ids=#{circulo_yarn_ids.join('+')}", basic_auth: auth)
# circulo_result["yarns"].map{|k, v| list << v}

# list.each do |yarn|
#   material = Material.create
#   Yarn.create(material:)

# end






