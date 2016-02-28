json.array!(@articles) do |article|
  json.extract! article, :id, :title, :description, :body
  json.url article_url(article, format: :json)
end
