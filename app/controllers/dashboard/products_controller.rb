class Dashboard::ProductsController < DashboardController
  before_action :set_avaliable_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(secure_params)
    @product.user = current_user

    if @product.save
      redirect_to @product, notice: 'Novo produto.'
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
      redirect_to @product, notice: 'Produto atualizado.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to posts_url, notice: 'Producto Removido'
  end

  private

  def set_avaliable_product
    @product = Product.find(params[:id])
  end

  def secure_params
    params.require(:product).permit(:name, :desc, :min_donation)
  end

end
