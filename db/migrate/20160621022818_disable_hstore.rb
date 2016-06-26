# frozen_string_literal: true
class DisableHstore < ActiveRecord::Migration
  def change
    disable_extension 'hstore' if extension_enabled?('hstore')
  end
end
