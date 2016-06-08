json.text entity.name
json.href "##{entity.name.downcase}"
json.tags [entity.kind]
json.nodes do
  json.array! entity.children, partial: 'entities/tree', as: :entity
end
