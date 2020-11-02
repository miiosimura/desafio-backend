class ImportCsv
  def self.call(file)
    clean_csv = File.read(file.path).delete('"')
    csv = CSV.parse(clean_csv, headers: true, col_sep: ';')
    csv_hash = []

    csv.each do |row|
      csv_hash << row.to_h
    end

    sao_paulo_only = csv_hash.select{ |row| row['sgUF'] == 'SP' }

    sao_paulo_only.each do |data|
      congressman = Congressman.find_or_create_by(
        name: data[data.keys.first],
        cpf: data['cpf'],
        external_id: data['ideCadastro'],
        uf: data['sgUF'],
        political_party: data['sgPartido'],
      )

      spend = Spend.find_or_create_by(
        congressman_id: congressman.id,
        description: data['txtDescricao'],
        provider: data['txtFornecedor'],
        liquid_value: (data['vlrLiquido'].to_f) * 100,
        document_emission_date: data['datEmissao'],
        document_url: data['urlDocumento']
      )
    end

    yearly_spend_query = Spend.
      group(:congressman_id).
      select(:congressman_id, 'SUM(liquid_value) AS total_spend')

    yearly_spend_query.each do |data|
      yearly_spend = YearlySpend.new
      yearly_spend.congressman_id = data.congressman_id
      yearly_spend.year = sao_paulo_only.first['numAno']
      yearly_spend.total_spend = data.total_spend
      yearly_spend.save
    end
  end
end