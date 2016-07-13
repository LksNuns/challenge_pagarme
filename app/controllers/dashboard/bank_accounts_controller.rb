class Dashboard::BankAccountsController < Dashboard::DashboardController

  def index
    @bank_accounts = current_user.bank_accounts
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(secure_params)
    @bank_account.user = current_user
    @bank_account.id_bank_account = 1;
    
    if @bank_account.save
      redirect_to dashboard_bank_accounts_path, notice: 'Novo conta.'
    else
      render :new
    end
  end

  def destroy
    @bank_account = current_user.bank_accounts.find(params[:id])
    @bank_account.destroy
    redirect_to dashboard_bank_accounts_path, notice: 'Conta Removido'
  end

  private

  def secure_params
    params.require(:bank_account).permit(:bank_code, :agencia, :agencia_dv, :conta,
                                         :conta_dv, :document_number, :legal_name)
  end
end
