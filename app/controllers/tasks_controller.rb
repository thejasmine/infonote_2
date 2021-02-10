class TasksController < ApplicationController
before_action :find_task, only: [ :edit, :update, :destroy]


  def new
    @task = Task.new
    @contact = Contact.find(params[:contact_id])
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    @contact = Contact.find(params[:contact_id])
    @task.contact_id = @contact.id
    if @task.save
      redirect_to contact_path(@contact.id), notice: 'Your task note has been created.'
    else
      raise
      render :new
    end
  end

  def edit
    authorize @task
  end

  def update
    authorize @task
    if @task.update(task_params)
      redirect_to contacts_path
    else
      render :edit
    end
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to contacts_path
  end

  private
  def task_params
    params.require(:task).permit(:time,:note,:contact_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
