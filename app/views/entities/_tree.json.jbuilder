json.text entity.name
json.tags [entity.kind]
json.selectedIcon "glyphicon glyphicon-stop"
json.color "#000000"
json.backColor "#F5F5F5"
json.href entity_url(entity)
json.selectable false
json.state {
  json.checked true
  json.expanded true
  json.selected false
}
json.nodes do
  json.array! entity.children, partial: 'entities/tree', as: :entity
end
