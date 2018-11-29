json.extract! ticket, :id, :user_id, :server_id, :edit_server, :delete_server, :comments, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
