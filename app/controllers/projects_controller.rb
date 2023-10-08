class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy tasks]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/finished
  def finished
    @projects = Project.where(active: false)
  end

  # GET /projects/finished
  def analytics
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @task = Task.new
    @projects = Project.all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Проект был успешно создан." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    processed_params = project_params
    processed_params[:end_date].empty? ? processed_params[:active] = true : processed_params[:active] = false
    respond_to do |format|
      if @project.update(processed_params)
        format.html { redirect_to project_url(@project), notice: "Проект был успешно обновлён." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_edit_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Проект был успешно удалён." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description, :deadline, :end_date, :active)
    end
end
