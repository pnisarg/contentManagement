class SectionsController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in
  before_action :find_page

  def index
    # @sections = Section.sorted
    @sections = @page.sections.sorted
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.order("position ASC")
    @section_count = Section.count
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id, :subject_id => @subject.id)
    else
      @pages = Page.order("position ASC")
      @section_count = Section.count
      render("edit")
    end
  end

  def delete
     @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id])
    section.destroy
    flash[:notice] = "Section '#{section.name}' destroyed successfully."
    redirect_to(:action => 'index', :page_id => @page.id, :subject_id => @subject.id)
  end

  def new
    @section = Section.new({:page_id => @page.id})
    @pages = Page.order("position ASC")
    @section_count = Section.count
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index', :page_id => @page.id, :subject_id => @subject.id)
    else
      @pages = Page.order("position ASC")
      @section_count = Section.count
      render('new')
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  private
  def section_params
    params.require(:section).permit(:page_id, :name, :position, :content_type, :content, :visible)
  end
  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
      @subject = Subject.find(params[:subject_id]) 
    end
  end
end
