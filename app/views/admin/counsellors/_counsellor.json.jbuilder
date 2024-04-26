json.extract! user, :id, :UserClass, :Pass, :Email, :UserStatus, :created_at, :updated_at
json.url user_url(user, format: :json)
