job = application.job

json.extract! application, :id, :professional_experience, :reasons, :user_id
json.extract! job, :title, :location, :job_type
json.company job.company.name
json.date application[:created_at]
json.cv rails_blob_url(application.user_cv)
