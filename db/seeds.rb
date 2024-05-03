# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Pessoa.destroy_all
pessoa1 = Pessoa.create(nome:"Sam", cpf:"123.123.456-90", valor_da_carteira:100)
pessoa1 = Pessoa.create(nome:"Frodo", cpf:"123.123.456-91", valor_da_carteira:100)
pessoa1 = Pessoa.create(nome:"Bilbo", cpf:"123.123.456-92", valor_da_carteira:100)
pessoa1 = Pessoa.create(nome:"Legolas", cpf:"123.123.456-93", valor_da_carteira:100)
pessoa1 = Pessoa.create(nome:"Gimli", cpf:"123.123.456-94", valor_da_carteira:100)
puts("Seed Completo!")
