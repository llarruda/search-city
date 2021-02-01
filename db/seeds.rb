# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

states = ['Paraná', 'Santa Catarina', 'Rio Grande do Sul']

parana = ['Curitiba', 'Lodrina', 'Foz do Iguaçu']
santa_catarina = ['Florianópolis', 'Joinville', 'Blumenau']
rio_grande = ['Porto Alegre', 'Caxia do Sul', 'Venâncio Aires']

state_cities = { 'Paraná' => parana, 'Santa Catarina' => santa_catarina, 'Rio Grande do Sul' => rio_grande }

states.each do |state_name|
  state = State.create name: state_name
  (0..2).each do |x|
    City.create state_id: state.id, name: state_cities[state_name][x]
  end
end
