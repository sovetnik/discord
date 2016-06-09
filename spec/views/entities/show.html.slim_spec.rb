require 'rails_helper'

RSpec.describe 'entities/show', type: :view do
  before(:each) do
    @entity = assign(:entity, Entity::Abstract.create!(
                                parent_id: 1,
                                sort_order: 2,
                                kind_num: 3,
                                name: 'Name',
                                desc: 'MyText',
                                deps: ''
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
