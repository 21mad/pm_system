class TasksController < ApplicationController
  # before_action :set_project
  before_action :set_task, only: [:update, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to project_path(@task.project_id)#, notice: 'Задача успешно создана.'
      # redirect_to "/projects/#{@task.project_id}#tasks", notice: 'Задача успешно создана.'
    else
      flash[:error] = 'Заполните все поля для создания задачи!'
      redirect_to project_path(@task.project_id)
    end
  end

  # def edit
  # end

  def update
    # updated_params = task_params
    # updated_params[:status] = !task_params[:status]
    updated_status = !@task.status
    if @task.update(status: updated_status)
      redirect_to "/projects/#{@task.project_id}"#, notice: 'Задача успешно обновлена.'
    else
      flash[:error] = 'Ошибка!'
      redirect_to new_project_task_path(@task.project_id)
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@task.project_id)#, notice: 'Задача успешно удалена.'
  end

  private

  # def set_project
  #   @project = Project.find(params[:project_id])
  # end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :priority, :status, :due_date, :project_id)
  end

end
