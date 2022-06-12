
json.documents @documents do |document|
  json.id document.id
  json.user document.user.try(:email)
  json.status document.status
  json.file url_for(document.file)
  json.created_at document.created_at
end
