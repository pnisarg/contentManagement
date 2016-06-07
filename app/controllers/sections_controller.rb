class SectionsController < ApplicationController
  layout "admin"

  def index
    @sections = Section.sorted
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @section.id)
    end
  end

  def delete
     @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id])
    section.destroy
    flash[:notice] = "Section '#{section.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  def new
    @section = Section.new()
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :content_type, :content, :visible)
  end
end
