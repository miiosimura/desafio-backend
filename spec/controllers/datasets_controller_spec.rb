require 'rails_helper'

RSpec.describe DatasetsController, type: :controller do
  describe 'POST #import' do
    let(:csv_file) { fixture_file_upload('spec/csv/small_base.csv') }
    let(:http_request) { post :import, params: { file: csv_file } }

    it 'returns 302' do
      http_request
      expect(response.status).to eq(302)
    end

    it 'expect congressmen count is equal to 1' do
      expect{ http_request }.to change(Congressman, :count).by(1)
    end

    it 'expect spends count is equal to 130' do
      expect{ http_request }.to change(Spend, :count).by(130)
    end

    it 'expect yearly_spends count is equal to 1' do
      expect{ http_request }.to change(YearlySpend, :count).by(1)
    end

    it 'renders the correct template' do
      http_request
      is_expected.to redirect_to(congressmen_path)
    end
  end
end