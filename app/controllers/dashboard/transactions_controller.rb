class Dashboard::TransactionsController < Dashboard::DashboardController

  def index
    @products = current_user.products
  end

  def show
    transaction = Transaction.find(params[:id])
    unless current_user == transaction.product.user
      return redirect_to dashboard_transactions_path, notice: "Transação Inválida"
    end
    @payables = PagarMe::Transaction.find(transaction.id_transaction).payables
  end

end
