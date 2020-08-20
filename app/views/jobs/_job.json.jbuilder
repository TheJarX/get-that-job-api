json.merge! job.as_json(except: [:created_at, :updated_at, :company_id])
json.date job[:created_at]
json.company do 
    company  = Company.find(job[:company_id])
    json.extract! company, :id, :name, :website
    json.logo_url rails_blob_url(company.logo)
    json.jobs_posted company.jobs.length
end
