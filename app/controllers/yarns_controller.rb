class YarnsController < ApplicationController
  def index
    @yarns = Yarn.all
  end

  def show
    @yarn = Yarn.find(params[:id])
  end
end
