class Dashboard::TransactionsController < Dashboard::DashboardController

  def index
    @transactions = Transaction.by_user(current_user.id)
  end

  def show
    transaction = PagarMe::Transaction.find(params[:id])
    unless current_user.id == transaction.metadata['user_id'].to_i
      return redirect_to dashboard_transactions_path, notice: "Transação Inválida"
    end
    @payables = transaction.payables
  end

end
