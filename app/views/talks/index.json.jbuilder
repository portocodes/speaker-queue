json.array!(@talks) do |talk|
  json.extract! talk, :id, :title, :description
  json.url talk_url(talk, format: :json)
end
