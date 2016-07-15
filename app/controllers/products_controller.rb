class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def checkout
    # transaction = PagarMe::Transaction.find_by_id(params[:token])
    # transaction.capture({:amount => 1000})
    # >>>>Params
    # "token"=>"test_transaction_EdubrKehhENuyTgJgTpsoWlEAuISJK", 
    # "payment_method"=>"credit_card",
    # "id"=>"6"
  end


  private
end
