json.array!(@blogs) do |blog|
  json.extract! blog, :id, :subject, :body, :published, :draft
  json.url blog_url(blog, format: :json)
end
