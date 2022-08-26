# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Cleaning database..."
User.destroy_all
Product.destroy_all

puts "Generating user"

user = User.new(first_name: "teste", last_name: "teste", email: "teste@teste.com", password: "123123")

puts 'Generating ten products'


  product1 = Product.new(
    name: "Kit Frescobol",
    description: "Par de Raquetes em Pinus para Frescobol, acompanha QUATRO bolinhas N3 1/2. UNICO KIT COM 4 BOLINHAS - MELHOR CUSTO BENEFÍCIO Raquete de extrema qualidade e resistência!",
    price: "15,90",
    quantity: rand(1..10),
    user: user,
    image_url: "https://imageup.me/images/483525a6-6bd6-42c8-b580-802bda10a6e6.jpg"
  )
  product1.save!

  product2 = Product.new(
    name: "Guarda-Sol",
    description: "Guarda Sol 2,4 Metros Diâmetro Z901 Cores Variadas Importway. Aumente o Conforto E Se Proteja Dos Raios Do Sol Nas Horas De Lazer! Os Guarda-Sóis Importway Possui Varias Estampas Para Decorar O Seu Momento De Conforto.",
    price: "14,90",
    quantity: rand(1..10),
    user: user,
    image_url: "https://imageup.me/images/9839d29c-7b13-45ad-9abe-488ed38b7ea5.jpg"
  )
  product2.save!

  product3 = Product.new(
    name: "Cadeira de Praia",
    description: "Dobrável, fácil e prática de carregar, a Cadeira Alta é ideal para ser levada para praia, camping, pescaria ou para aquela cervejinha de final de tarde com os amigos na varanda.",
    price: "9,90",
    quantity: rand(1..10),
    user: user,
    image_url: "https://imageup.me/images/762f7ead-f9d6-425e-a666-66044028ce4f.jpg"
  )
  product3.save!

  product4 = Product.new(
    name: "Prancha de Surf",
    description: "Fique à vontade e pegue algumas ondas épicas!
    A prancha de surf inflável Hydro-Force Compact 8 é perfeita para surfistas de todos os níveis de habilidade.",
    price: "99,90",
    quantity: rand(1..10),
    user: user,
    image_url: "https://imageup.me/images/25784977-019c-47cd-9ab7-012f710cd07b.jpg"
  )
  product4.save!

  product5 = Product.new(
    name: "Bola de Futevolei",
    description: "A Bola Futevôlei Penalty XXI é desenvolvido exclusivamente para você mostrar suas habilidades nas areias com muito mais qualidade e eficiência nas partidas de Futevôlei. Por conter construção que elimina as costuras, a bola é resistente à água, garantindo durabilidade extra para você praticar o esporte na praia. E tem mais, com camada de amortecimento interno que deixa a bola mais macia, proporciona muito mais conforto ao diminuir o impacto do corpo com a bola. Adquira a sua e una lazer aos exercícios físicos!",
    price: "19,90",
    quantity: rand(1..10),
    user: user,
    image_url: "https://imageup.me/images/e7239949-0245-41b1-8bf6-fc0bff5a046f.jpg"
  )
  product5.save!

  product6 = Product.new(
    name: "Toalha / Canga de Praia",
    description: "As Cangas de Praia são fabricadas na Indonésia, dentro de um rigoroso processo de qualidade. Com cores vibrantes e lindas estampas desenvolvidas com exclusividade.",
    price: "19,90",
    quantity: rand(1..10),
    user: user,
    image_url: "https://imageup.me/images/2741da4c-3606-4bdb-b2b6-d417891589bc.jpg"
  )
  product6.save!

puts 'Finished!'
