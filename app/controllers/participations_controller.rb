class ParticipationsController < ApplicationController
  # before_action :set_participation, only: :destory
  
  def new
    @participations = Participation.where(project_id: params[:project_id])
    @project = Project.find(params[:project_id])
    @participation = @project.participations.build
  end

  def create
    @participation = Participation.new(participation_params)
    # p participation_params
    # p '------------------------------------------------------'
    if @participation.save
      redirect_to new_project_participation_path(@participation.project_id)
      # format.turbo_stream { render: :form_edit_update }

      # redirect_to project_path(@participation.project_id)
    end
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
    redirect_to new_project_participation_path(@participation.project_id)
    # redirect_to project_path(@participation.project_id)
    # respond_to do |format|
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @project.errors, status: :unprocessable_entity }
    #     format.turbo_stream { render :remote, status: :unprocessable_entity }
    # end
  end

  private

  def participation_params
    params.require(:participation).permit(:project_id, :user_id)
  end

  # def check_owner
  #   redirect_to redirect_to new_project_participation_path(@participation.project_id) if current_user.id != @project.user_id
  # end

end
