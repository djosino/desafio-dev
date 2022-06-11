# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TransactionType.create(id: 1, description: 'Débito', entry: true)
TransactionType.create(id: 2, description: 'Boleto', entry: false)
TransactionType.create(id: 3, description: 'Financiamento', entry: false)
TransactionType.create(id: 4, description: 'Crédito', entry: true)
TransactionType.create(id: 5, description: 'Recebimento Empréstimo', entry: true)
TransactionType.create(id: 6, description: 'Vendas', entry: true)
TransactionType.create(id: 7, description: 'Recebimento TED', entry: true)
TransactionType.create(id: 8, description: 'Recebimento DOC', entry: true)
TransactionType.create(id: 9, description: 'Aluguel', entry: false)

