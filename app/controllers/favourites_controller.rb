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
      redirect_to yarns_path
    else
      render :new
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def favourite_params
    params.require(:favourite).permit(:yarn_id)
  end

end
