class NerdsController < ApplicationController

  def index
    @nerds = Nerd.confirmeds.paginate(:page => params[:page])
  end

  def new
    @nerd = Nerd.new
  end

  def create
    @nerd = Nerd.new params[:nerd]
    if @nerd.save
      redirect_to root_path
    else
      flash[:notice] = @nerd.errors.full_message
      render :new
    end
  end

  def destroy
    Nerd.find(params[:id]).send_remove_mail
    flash[:notice] = 'Um email foi enviado para este usuário! Siga as instruções no email para concluir a remoção!'
    redirect_to root_path
  end
  
  def remove
    Confirmation.find_by_token(params[:token]).nerd.destroy
    redirect_to root_path
  end
  
  def confirm
    Confirmation.find_by_token(params[:token]).confirm!
    redirect_to root_path
  end
  
  def tags
    @nerds = Nerd.tagged_with(params[:name]).paginate(:page => params[:page])
    render :index
  end
  
end
