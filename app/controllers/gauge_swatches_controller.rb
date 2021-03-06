class GaugeSwatchesController < ApplicationController
  def index
    @gauge_swatches = GaugeSwatch.all
  end

  def my_gauges
    @my_gauge = GaugeSwatch.where(user: current_user)
  end

  def new
    @yarn = Yarn.all
    @gauge_swatch = GaugeSwatch.new
  end

  def create
    @gauge = GaugeSwatch.new(gauge_swatches_params)
    @gauge.user = current_user
    @gauge.yarns << Yarn.find(params[:Yarn]) if params[:Yarn].present?
    @gauge.yarns << Yarn.find(params[:Yarn2]) if params[:Yarn2].present?
    @gauge.yarns << Yarn.find(params[:Yarn3]) if params[:Yarn3].present?

    if @gauge.save
      redirect_to gauge_swatch_path(@gauge)
    else
      render new
    end
  end

  def show
    @gauge = GaugeSwatch.find(params[:id])
  end

  private

  def gauge_swatches_params
    params.require(:gauge_swatch).permit(:image_url, :gauge, :needles)
  end
end

