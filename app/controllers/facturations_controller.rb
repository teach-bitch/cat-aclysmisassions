class FacturationsController < ApplicationController
  before_action :set_facturation, only: [:show]

  def index
    @facturations = Facturation.all
  end

  def show
  end

  def create
    @facturation = Facturation.new(facturation_params)

    respond_to do |format|
      if @facturation.save
        format.html { redirect_to @facturation, notice: 'Facturation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facturation
      @facturation = Facturation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facturation_params
      params.require(:facturation).permit(:price)
    end
end
