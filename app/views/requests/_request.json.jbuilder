json.extract! request, :id, :user_id, :edit, :delete, :comments, :created_at, :updated_at
json.url request_url(request, format: :json)
