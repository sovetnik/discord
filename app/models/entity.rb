# frozen_string_literal: true
module Entity
  KINDS = %w(Ability Axiom Context Domain Inference Layer Model Origin Stock Story).freeze
  ABSTRACT = Struct.new 'Abstract', :id, :name, :kind, :layer_id
end
