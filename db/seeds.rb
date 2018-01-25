# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rj = Estado.create(uf: "RJ", nome: "Rio de Janeiro")
sp = Estado.create(uf: "SP", nome: "São Paulo")
mg = Estado.create(uf: "MG", nome: "MInas Gerais")

Cidade.create(estado_id: rj.id, nome: "Vassouras")
Cidade.create(estado_id: sp.id, nome: "Santos")
Cidade.create(estado_id: mg.id, nome: "Belo Horizonte")
