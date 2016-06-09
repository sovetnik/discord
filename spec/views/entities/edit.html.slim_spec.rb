require 'rails_helper'

RSpec.describe 'entities/edit', type: :view do
  before(:each) do
    @entity = assign(:entity, Entity::Abstract.create!(
                                parent_id: nil,
                                sort_order: 1,
                                kind_num: 1,
                                name: 'MyString',
                                desc: 'MyText',
                                deps: ''
    ))
  end

  it 'renders the edit entity form' do
    render

    assert_select 'form[action=?][method=?]', entity_path(@entity), 'post' do
      assert_select 'input#entity_parent_id[name=?]', 'entity[parent_id]'

      assert_select 'input#entity_sort_order[name=?]', 'entity[sort_order]'

      assert_select 'input#entity_kind_num[name=?]', 'entity[kind_num]'

      assert_select 'input#entity_name[name=?]', 'entity[name]'

      assert_select 'textarea#entity_desc[name=?]', 'entity[desc]'

      assert_select 'input#entity_deps[name=?]', 'entity[deps]'
    end
  end
end
