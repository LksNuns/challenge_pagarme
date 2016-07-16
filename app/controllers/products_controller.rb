class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def checkout
    amount = ((params[:amount].to_f)*100).to_i
    recipient = Product.find(params[:id]).recipient

    begin
      transaction = PagarMe::Transaction.find_by_id(params[:token])

      transaction.split_rules = [
        { recipient_id: 're_ciqokk0ee00mzx26efv6t0e3h', percentage: 20 },
        { recipient_id: recipient.id_recipient, percentage: 80 }
      ]
      transaction.amount = amount
      transaction.charge
      redirect_to products_path, notice: "sucesso"
    rescue Exception => e
        logger.debug ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        logger.debug "#{e}"
        redirect_to products_path, notice: "erro"
      end

    # transaction = PagarMe::Transaction.find_by_id(params[:token])
    # transaction.capture({:amount => 1000})
    # >>>>Params
    # "token"=>"test_transaction_EdubrKehhENuyTgJgTpsoWlEAuISJK",
    # "payment_method"=>"credit_card",
    # "id"=>"6"
  end


  private
end
