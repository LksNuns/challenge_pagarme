class Dashboard::RecipientsController < Dashboard::DashboardController
  before_action :set_recipient
  before_action :set_bank_accounts, only: [:new, :create, :edit, :update]
  before_action :has_recipient, only: [:new, :create]
  before_action :hasnt_recipient, except: [:new, :create]


  def new
    @recipient = Recipient.new
  end


  def create
    recipient_id = params[:recipient][:bank_account_id]
    unless recipient_id && @bank_accounts.find(recipient_id)
      return redirect_to dashboard_recipient_path, notice: 'Você Precisa selecionar uma Conta Válida'
    end

    @recipient = Recipient.new(secure_params)
    @recipient.user = current_user

    if @recipient.save
      redirect_to dashboard_recipient_path, notice: 'Recebedor Adicionado.'
    else
      render :new
    end
  end

  def show
    @pagarme_recipient = PagarMe::Recipient.find(@recipient.id_recipient)
  end

  private

  def set_recipient
    @recipient = current_user.recipient
  end

  def set_bank_accounts
    @bank_accounts = current_user.bank_accounts
  end

  def has_recipient
    if @recipient
      return redirect_to dashboard_recipient_path
    end
  end

  def hasnt_recipient
    unless @recipient
      return redirect_to new_dashboard_recipient_path
    end
  end

  def secure_params
    params.require(:recipient).permit(:transfer_interval, :bank_account_id, :transfer_day)
  end

end
