json.array!(@boards) do |board|
  json.extract! board, :id, :title, :description
  json.url board_url(board, format: :json)
end
