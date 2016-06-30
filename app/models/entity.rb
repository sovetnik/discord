# frozen_string_literal: true
module Entity
  KINDS = %w(Aught Story Domain Layer Model Context Inference).freeze
  ABSTRACT = Struct.new 'Abstract', :id, :name, :kind, :layer_id
end
