require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#number_to_currency_br' do
    it 'return format number' do
      expect(helper.number_to_currency_br(125478)).to eq("R$ 1.254,78")
    end
  end
end