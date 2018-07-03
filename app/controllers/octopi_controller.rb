class OctopiController < ApplicationController
before_action :find_octopus, only: [:show, :edit, :update, :destroy]

  def index
    @octopi = Octopus.all
  end

  def show

  end

  def new
    @octopus = Octopus.new
  end

  def create
    @octopus = Octopus.create(octopus_params)
    redirect_to octopus_path(@octopus) #redirects you to the show page
  end

  def edit
    #will pull up/render edit view
  end

  def update
    @octopus.update(octopus_params)
    redirect_to @octopus #redirects you to the show page
  end

  def destroy
    @octopus.destroy
    redirect_to octopi_path #redirects you to index page
  end

private

  def find_octopus
    @octopus = Octopus.find(params[:id])
  end

  def octopus_params
    params.require(:octopus).permit(:name, :legs)
  end
end
