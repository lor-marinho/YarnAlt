class YarnsController < ApplicationController
  def index
    if params[:query]
      @yarns = Yarn.search_by_name(params[:query])
    else
      @yarns = Yarn.all
    end
  end

  def show
    @yarn = Yarn.find(params[:id])
  end
end
