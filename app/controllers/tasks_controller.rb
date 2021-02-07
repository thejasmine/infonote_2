class TasksController < ApplicationController
before_action :find_task, only: [ :edit, :update, :destroy]


  def new
    @task = Task.new
    @contact = Contact.find(params[:contact_id])
  end

  def create
    @task = Task.new(task_params)
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
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
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
