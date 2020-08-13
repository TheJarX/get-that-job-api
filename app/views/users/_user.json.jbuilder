json.extract! user, :id, :name, :email, :phone, :experience, :github_url, :linkedin_url
json.token user.authentication_token
# json.url user_url(user, format: :json)
