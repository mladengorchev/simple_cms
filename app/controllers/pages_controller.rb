class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private
    def page_params
      params.require(:page).permit(:name, :position, :visible)
    end
end
