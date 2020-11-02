module ApplicationHelper
  def number_to_currency_br(number)
    number_to_currency((number/100.0), unit: "R$ ", separator: ',', delimiter: '.')
  end
end
