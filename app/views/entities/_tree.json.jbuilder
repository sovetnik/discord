json.text entity.name
json.tags [entity.kind]
json.selectedIcon 'glyphicon glyphicon-stop'
# json.color "#000000"
# json.backColor "#F5F5F5"
json.href entity_url(entity)
json.selectable false
json.state do
  json.checked true
  json.expanded true
  json.selected entity.id == entity_id
end
json.nodes do
  json.array! entity.children do |child|
    json.partial! 'entities/tree', entity: child, entity_id: entity_id
  end
end
