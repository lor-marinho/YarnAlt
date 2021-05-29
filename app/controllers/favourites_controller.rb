class FavouritesController < ApplicationController
  def index
  end

  def new
    @favourite = Favourite.new
  end

  def create
    @yarn = Yarn.find(params[:yarn_id])
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.yarn = @yarn

    if @favourite.save
      redirect_to yarn_path(@yarn)
    else
      render :new
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @yarn = @favourite.yarn
    @favourite.destroy
    redirect_to yarn_path(@yarn)
  end

  private

  def favourite_params
    params.require(:favourite).permit(:yarn_id)
  end

end
