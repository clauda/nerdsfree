class NerdsController < ApplicationController

  def index
    @nerds = Nerd.confirmeds.paginate :page => params[:page], :per_page => 8, :order => 'random()'
  end

  def new
    render :partial => 'form'
  end

  def create
    @nerd = Nerd.new params[:nerd]
    if @nerd.save
      flash[:notice] = 'Enviamos as instruções de confirmação da sua participação para o seu informado!'
      redirect_to root_path
    else
      flash[:notice] = @nerd.errors.full_messages
      render :faq
    end
  end

  def destroy
    Nerd.find(params[:id]).send_remove_mail
    flash[:notice] = 'Enviamos um email! Siga as instruções no email para concluir a remoção!'
    redirect_to root_path
  end
  
  def remove
    @confirmation = Confirmation.find_by_token(params[:token])
    unless @confirmation.nil?
      @confirmation.nerd.destroy 
      flash[:notice] = 'Sua participação foi removida.'
    else
      flash[:notice] = 'Não Encontrado. Tente Novamente.'
    end
    redirect_to root_path
  end
  
  def confirm
    @confirmation = Confirmation.find_by_token(params[:token])
    unless @confirmation.nil?
      @confirmation.nerd.confirm! 
      flash[:notice] = 'Bem Vindo ao Hall de Nerds de Natal.'
    else
      flash[:notice] = 'Não Encontrado. Tente Novamente.'
    end
    redirect_to root_path
  end
  
  def tags
    @nerds = Nerd.tagged_with(params[:name]).paginate(:page => params[:page])
    render :index
  end
  
  def search
    @nerds = Nerd.where("name LIKE '%#{params[:search]}%'").confirmeds.paginate(:page => params[:page], :per_page => 8)
    render :index
  end
  
  def faq
  end
  
end
