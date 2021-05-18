
require 'httparty'
require 'awesome_print'
auth = { username: '6dbb3561967f4f03932a070fd05d3f89', password: 'xMcjWF9yKRfXTCmdLdw5Fl3G92hC00hpkHfFifLd' }

def get_yarn_list(brand, auth)
  response = HTTParty.get("https://api.ravelry.com/yarns/search.json?query=#{brand}", basic_auth: auth)
  response_body = JSON.parse(response.body)
  yarn_ids = response_body.fetch('yarns').map { |i| i['id'] }
  yarn_list = get_yarns(yarn_ids, auth)
end

def get_yarns(yarn_ids, auth)
  list = []
  response = HTTParty.get("https://api.ravelry.com/yarns.json?ids=#{yarn_ids.join('+')}", basic_auth: auth)
  response_body = JSON.parse(response.body)
  response_body.fetch('yarns').map { |_k, v| list << v }
  list
end

YARN_BRANDS = %w[garnstudio fios%20pingouin filcolana circulo sandnesgarn].freeze
y
arn_list = YARN_BRANDS.map { |brand| get_yarn_list(brand, auth) }.flatten!

yarn_list.each do |yarn|
  # AQUI VAI A LÓGICA PARA CRIAR O YARN E O QUE MAIS QUISEREM. O yarn_list é uma lista de hashs
  # create materials
  materials = yarn['yarn_fibers'].each do |fiber|
    material = Material.create_or_find_by(
      percentage: fiber['percentage'],
      name: fiber['name']
    )
    puts "OK: material #{material.id} - #{material.name} created"
  end
  # create yarn with materials
  yarn = Yarn.new(
    name: yarn['name']
  )
  yarn.materials << materials
  yarn.save!
  puts "OK: material #{yarn.id} - #{yarn.name} created"
end



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


# User.destroy_all

# puts 'Creating user...'

# johndoe = User.new(
#   email: "john@doe.com",
#   password: "123456",
#   )
# johndoe.save!

# maryjane = User.new(
#   email: "mary@jane.com",
#   password: "123456",
#   )
# maryjane.save!

# puts 'Finished!'



