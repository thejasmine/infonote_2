class ContactsController < ApplicationController
  before_action :find_contact, only: [ :show, :edit, :update, :destroy]
  def index
    @contacts = policy_scope(Contact)
    #@meetings = policy_scope(Meeting)
  end

  def show
    authorize @contact
  end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    @contact.user = current_user
    if @contact.save
      authorize @contact
      redirect_to contacts_path, notice: 'Your Contact has been created.'
    else
      raise
      render :new
    end
  end

  def edit
    authorize @contact
  end

  def update
    authorize @contact
    if @contact.update(contact_params)
      redirect_to contacts_path
    else
      render :edit
    end
  end

  def destroy
    authorize @contact
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
