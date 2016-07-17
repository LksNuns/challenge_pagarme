module ApplicationHelper

  def formatted_real_coin(number)
    number_to_currency(number.to_f/100, unit: "R$", separator: ",", delimiter: "")
  end

end
