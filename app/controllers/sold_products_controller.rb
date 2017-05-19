
class SoldProductsController < ApplicationController
  before_action :set_products

  def index
  end

  def create
    uploaded_file = params[:sold_products_file]

    if uploaded_file.respond_to? :path
      tmp_file = File.open(uploaded_file.path)
      parser = SoldProductsFile.new(tmp_file)
      saved = SoldProduct.import(parser)
      tmp_file.close
      
      if saved
        @sold_products = SoldProduct.all
        flash[:message] = I18n.t(:sucessfully_imported)
      else
        flash[:error] = I18n.t(:failed_to_import)
      end
    else
      flash[:error] = I18n.t(:failed_to_import)
    end

    render :index
  end
  
  private
  def set_products
    @sold_products = SoldProduct.all
    @total = @sold_products.map(&:total).reduce(:+)
  end
end
