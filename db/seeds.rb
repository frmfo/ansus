# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create!(username: "Suporte", email: "suporte@ansus.com.br", password: "@geral01", admin: :true)

role1 = Role.create!(name: "admnistrador")
role2 = Role.create!(name: "gerenciador")
role3 = Role.create!(name: "controlador")
role4 = Role.create!(name: "pesagem")
role5 = Role.create!(name: "fornecedor")
role6 = Role.create!(name: "relatorio")