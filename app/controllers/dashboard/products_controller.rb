class Dashboard::ProductsController < Dashboard::DashboardController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :verify_recipient, except: [:destroy]

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(secure_params)
    @product.user = current_user
    if @product.save
      redirect_to dashboard_products_path, notice: 'Novo produto.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(secure_params)
      redirect_to dashboard_products_path(@product), notice: 'Produto atualizado.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to dashboard_products_path, notice: 'Producto Removido'
  end

  private

  def verify_recipient
    unless current_user.recipient
      return redirect_to dashboard_bank_accounts_path,
        notice: "É necessário ter um recebedor para poder anunciar um produto"
    end
  end

  def set_product
    @product = current_user.products.find(params[:id])
  end

  def secure_params
    params.require(:product).permit(:name, :desc, :min_donation)
  end

end
