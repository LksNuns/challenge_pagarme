class Transaction

  attr_accessor :amount, :product_id, :token

  def initialize(attributes = {})
    self.amount = attributes[:amount]
    self.product_id = attributes[:id]
    self.token = attributes[:token]
  end

  def charge
    raise Exception.new("Token não informado") unless token
    raise Exception.new("Dinheiro não informado") unless amount
    raise Exception.new("Faltando Id do produto") unless product_id
    pagarme_amount = to_pagarme_amount(self.amount)
    pagarme_recipient = set_recipient_by_product_id(self.product_id)

    raise Exception.new("Faltando recebedor") unless pagarme_recipient
    pagarme_split_rules = [
      { recipient_id: Rails.application.secrets.site_recipient, percentage: 20 },
      { recipient_id: pagarme_recipient, percentage: 80 }
    ]

    transaction = PagarMe::Transaction.find_by_id(self.token)
    transaction.amount = pagarme_amount
    transaction.split_rules = pagarme_split_rules

    begin
      transaction.charge
    rescue Exception => e
      raise e
    end
  end

  private
  
  def to_pagarme_amount(money)
     return ((money.to_f)*100).to_i if money
  end

  def set_recipient_by_product_id(id)
    product = Product.find(id)
    return product.recipient.id_recipient if product
  end

end
