
json.id @document.id
json.user @document.user.try(:email)
json.status @document.status
json.file url_for(@document.file)
json.created_at @document.created_at
json.transactions_value number_to_currency(@transactions.total_value)
json.transactions @transactions do |transaction|
  json.transaction_type transaction.transaction_type.try(:description)
  json.date l(transaction.date)
  json.hour transaction.decorate.hour
  json.value number_to_currency(transaction.value)
  json.credit_card transaction.credit_card
  json.owner transaction.owner
  json.store transaction.store
  json.created_at transaction.created_at
end
