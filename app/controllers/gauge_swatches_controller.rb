class GaugeSwatchesController < ApplicationController
  def new
    @yarn = Yarn.all
    @gauge_swatch = GaugeSwatch.new
  end

  def create
    @gauge = GaugeSwatch.new(gauge_swatches_params)
    @gauge.yarns << Yarn.find(params[:Yarn]) if params[:Yarn].present?
    @gauge.yarns << Yarn.find(params[:Yarn2]) if params[:Yarn2].present?
    @gauge.yarns << Yarn.find(params[:Yarn3]) if params[:Yarn3].present?

    @gauge.save
  end

  def show
    @gauge = GaugeSwatch.find(params[:id])
  end

  private

  def gauge_swatches_params
    params.require(:gauge_swatch).permit(:image_url, :gauge, :needles)
  end
end

