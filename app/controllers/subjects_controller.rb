class SubjectsController < ApplicationController
  # layout false
  layout "admin"

  before_action :confirm_logged_in
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'default'})
    @subjects_count = Subject.count + 1
  end

  def edit
    @subject = Subject.find(params[:id])
    @subjects_count = Subject.count
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject created successfully."
      redirect_to(:action => 'index')
    else
      @subjects_count = Subject.count + 1
      render('new')
    end
  end

  def update
    #find existing object
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully."
      redirect_to(:action => 'show', :id => @subject.id)
    else
      @subjects_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
