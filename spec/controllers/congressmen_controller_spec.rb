require 'rails_helper'

RSpec.describe CongressmenController, type: :controller do
  describe 'GET #index' do
    let(:congressman) { create_list(:congressman, 5) }
    before { get :index }

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'assigns all the congressmen' do
      assert_equal Congressman.all, assigns(:congressmen)
    end

    it 'renders the correct template' do
      assert_template 'congressmen/index'
    end
  end

  describe 'GET #show' do
    let(:congressman) { create(:congressman) }
    setup do
      create(:spend, congressman: congressman)
      create(:spend, congressman: congressman, liquid_value: 89_000)
    end
    before { get :show, params: { id: congressman.id, year: '2020' } }

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'assign the given congressman id' do
      assert_equal congressman, assigns(:congressman)
    end

    it 'assign the congressman`s highest spend on max_value'  do
      assert_equal 89_000, assigns(:max_value)
    end

    it 'renders the correct template' do
      assert_template 'congressmen/show'
    end
  end

end