class YarnsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

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
    elsif params[:query] && @option == '5'
      @yarns = Yarn.search_by_brand(params[:query])
    else
      @yarns = Yarn.all.order("RANDOM()")
    end
  end

  def show
    @favourite = Favourite.where(user: current_user, yarn: params[:id])
    @yarn = Yarn.find(params[:id])
    @chatroom = Chatroom.where(yarn: @yarn)
    @yarn_equivalents = Yarn.where(gauge: @yarn.gauge).where.not(id: @yarn.id).order("RANDOM()")

  end
end






