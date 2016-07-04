# frozen_string_literal: true
module Entity
  KINDS = %w(Aught Story Domain Layer Stock Model Context Ability Axiom Inference).freeze
  ABSTRACT = Struct.new 'Abstract', :id, :name, :kind, :layer_id
end
