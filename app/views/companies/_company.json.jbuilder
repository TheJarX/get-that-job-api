json.extract! company, :id, :name, :website, :description, :email
json.token company.authentication_token
json.logo_url url_for(company.logo)


