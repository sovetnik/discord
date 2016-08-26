# frozen_string_literal: true

json.text entity.producer.sentence
json.tags [entity.kind]
json.selectedIcon 'glyphicon glyphicon-play'
# json.collapseIcon 'glyphicon glyphicon-chevron-down'
# json.expandIcon 'glyphicon glyphicon-triangle-right'
# json.color "#000000"
# json.backColor "#F5F5F5"
json.href entity_url(entity)
json.selectable false
json.state do
  # json.checked true
  json.expanded true
  json.selected entity.id == entity_id
end
if hash_tree[entity]
  json.nodes do
    json.array! hash_tree[entity].keys.each do |key|
      json.partial! 'entities/tree', entity: key, entity_id: entity_id, hash_tree: hash_tree[entity]
    end
  end
end
