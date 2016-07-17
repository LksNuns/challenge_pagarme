class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def checkout
    transaction = Transaction.new(params)
    begin
      transaction.charge
      redirect_to products_path, notice: "Sua doação foi realizada com sucesso"
    rescue Exception => e
      redirect_to products_path, notice: "Erro: #{e}"
      end
  end

end
