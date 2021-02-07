class ContactsController < ApplicationController
  before_action :find_contact, only: [ :show, :edit, :update, :destroy]
  def index
    @contacts = policy_scope(Contact)
    #@meetings = policy_scope(Meeting)
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to @contact, notice: 'Your Contact has been created.'
    else
      raise
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name,:email,:phone,:linkedIn,:company,:position, :short_note,:other_url)
  end

  def find_contact
     @contact = Contact.find(params[:id])
  end
end
