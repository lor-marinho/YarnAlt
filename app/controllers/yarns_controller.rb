class YarnsController < ApplicationController
  def index
    @option = params[:option_id]
    if params[:query] && @option == '1'
      @yarns = Yarn.search_by_name(params[:query])
    elsif params[:query] && @option == '2'
      @yarns = Yarn.search_by_weight(params[:query])
    elsif params[:query] && @option == '3'
      @yarns = Yarn.search_by_needles(params[:query])
    elsif params[:query] && @option == '4'
      @yarns = Yarn.search_by_gauge(params[:query])
    else
      @yarns = Yarn.all
    end
  end

  def show
    @favourite = Favourite.where(user: current_user, yarn: params[:id])
    p "favorito"
    p @favourite
    @yarn = Yarn.find(params[:id])
  end
end
