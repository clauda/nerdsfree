class NerdsController < ApplicationController

  def index
    @nerds = Nerd.confirmeds.paginate :page => params[:page], :per_page => 8, :order => 'RAND()'
  end

  def new
    render :partial => 'form'
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
    @confirmation = Confirmation.find_by_token(params[:token])
    @confirmation.nerd.destroy unless @confirmation.nil?
    redirect_to root_path
  end
  
  def confirm
    @confirmation = Confirmation.find_by_token(params[:token])
    @confirmation.nerd.confirm! unless @confirmation.nil?
    redirect_to root_path
  end
  
  def tags
    @nerds = Nerd.tagged_with(params[:name]).paginate(:page => params[:page])
    render :index
  end
  
  def search
    @nerds = Nerds.confirmeds.where("name LIKE '%#{params[:search]}%'").paginate(:page => params[:page])
    render :index
  end
  
  def faq
  end
  
end
