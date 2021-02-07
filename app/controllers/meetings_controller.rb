class MeetingsController < ApplicationController
  before_action :find_meeting, only: [ :edit, :update, :destroy]


  def new
    @meeting = Meeting.new
    @contact = Contact.find(params[:contact_id])
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @contact = Contact.find(params[:contact_id])
    @meeting.contact_id = @contact.id
    if @meeting.save
      redirect_to contact_path(@contact.id), notice: 'Your meeting note has been created.'
    else
      raise
      render :new
    end
  end

  def edit
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to contacts_path
    else
      render :edit
    end
  end

  def destroy
    @meeting.destroy
    redirect_to contacts_path
  end

  private
  def meeting_params
    params.require(:meeting).permit(:title,:note,:meeting_time,:contact_id)
  end

  def find_meeting
    @meeting = Meeting.find(params[:id])
  end
end

