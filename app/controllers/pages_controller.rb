class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :waitforit ]

  def home
    @yarns = Yarn.all.order("RANDOM()")
    # @materials = Material.all
    # @brands = Brand.all
  end
end
