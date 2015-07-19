class SubjectsController < ApplicationController
  
  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    #Instantiate a new object using form params
    @subject = Subject.new(subject_params)
    #Save object
    if @subject.save
    flash[:notice] = "Subject created successfully."
    #If save succeeds, redirect to the index action
      redirect_to(:action => 'index')
    else#If save fails, redisplay form for user to fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
     #Find an existing object using form params
    @subject = Subject.find(params[:id])
    #Update object
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully."
    #If update succeeds, redirect to the show action
      redirect_to(:action => 'show', :id => @subject.id)
    else#If update fails, redisplay form for user to fix problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
     subject = Subject.find(params[:id]).destroy
     flash[:notice] = "Subject '#{subject.name}' deleted successfully."
     redirect_to(:action => 'index')
  end
  

  private

    def subject_params
      #same as using "params[:usbject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible)
    end
end
