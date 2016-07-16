class Dashboard::RecipientsController < Dashboard::DashboardController
  before_action :set_recipient
  before_action :has_recipient, :set_bank_accounts, only: [:new, :create]
  before_action :hasnt_recipient, except: [:new, :create]


  def new
    @recipient = Recipient.new
  end


  def create
    @recipient = Recipient.new(secure_params)
    bank_account = @bank_accounts.find(params[:bank_account_id])
    @recipient.bank_account_id = bank_account.id_bank_account if bank_account
    @recipient.user = current_user

    if @recipient.save
      redirect_to dashboard_recipient_path, notice: 'Recebedor Adicionado.'
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @recipient.update(secure_params)
      redirect_to dashboard_recipients_path(@recipient), notice: 'Recebedor Atualizado.'
    else
      render :edit
    end
  end

  def destroy
    @recipient.destroy
    redirect_to dashboard_recipients_path, notice: 'Recebedor Removido'
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
