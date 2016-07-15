class Dashboard::RecipientsController < Dashboard::DashboardController
  before_action :set_recipient, only: [:show, :edit, :update, :destroy]

  def index
    @recipient = current_user.recipient
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(secure_params)
    if @recipient.save
      redirect_to dashboard_products_path, notice: 'Recebedor Adicionado.'
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

  def secure_params
    params.require(:recipient).permit(:transfer_interval, :transfer_day, :transfer_enabled)
  end

end
