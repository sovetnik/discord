json.array!(@entities) do |entity|
  json.extract! entity, :id, :parent_id, :sort_order, :kind_num, :name, :desc, :deps
  json.url entity_url(entity, format: :json)
end
