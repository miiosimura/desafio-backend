FactoryBot.define do
  factory :congressman do
    name { 'João da Silva' }
    cpf { '594.428.910-49' }
    external_id { '1234' }
    uf { 'SP' }
    political_party { 'PT' }
  end
end