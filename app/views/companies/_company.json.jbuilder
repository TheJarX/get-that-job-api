json.extract! company, :id, :name, :website, :description, :email
json.token company.authentication_token
json.logo_url rails_blob_url(company.logo)


