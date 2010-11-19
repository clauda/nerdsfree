class NerdsController < ApplicationController

  def index
    @nerds = Nerd.confirmeds.paginate(:page => params[:page])
  end

  def show
    @nerd = Nerd.find(params[:id])
  end

  def new
    @nerd = Nerd.new
  end

  def create
    @nerd = Nerd.new(params[:nerd])
    if @nerd.save
      redirect_to(@nerd, :notice => 'Nerd was successfully created.')
    else
      render :new
    end
  end

  def destroy
    @nerd = Nerd.find(params[:id])
    @nerd.destroy
    redirect_to nerds_path
  end
  
  def tags
    @nerds = Nerd.tagged_with(params[:name]).paginate(:page => params[:page])
    render :index
  end
end
