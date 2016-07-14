# frozen_string_literal: true
module Entity
  KINDS = %w(Ability Aught Axiom Context Contract Domain Guaranty Inference Layer Model Stock Story).freeze
  ABSTRACT = Struct.new 'Abstract', :id, :name, :kind, :layer_id
end
