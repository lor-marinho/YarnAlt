class FavouritesController < ApplicationController
  def index
  end

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.yarn = @yarn
    @favourite.user = current_user

    if @favourite.save
      redirect_to favourite_path(@favourite)
    else
      render :new
    end
  end

  def destroy
    @favourite.destroy
    redirect_to favourite_path
  end

  private

  def favourite_params
    params.require(:favourite).permit(:user_id, :yarn_id)
  end

end
