FactoryBot.define do
  factory :spend do
    congressman
    description { 'Passagem aérea' }
    provider { 'Gol' }
    liquid_value { 1_500 }
    document_emission_date { '2020-08-21' }
    document_url { 'http://camara.leg.br/cota-parlamentar/nota-fiscal-eletronica?ideDocumentoFiscal=7011225' }
  end
end