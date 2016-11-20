json.extract! newsletter, :id, :title, :body, :created_at, :updated_at
json.url newsletter_url(newsletter, format: :json)