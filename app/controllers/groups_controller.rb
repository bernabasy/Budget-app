class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index
    @current_user = current_user
    @groups = current_user.groups
  end

  # GET /groups/new
  def new
    @current_user = current_user
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to root_path, notice: 'Your category is created successfully'
    else
      flash[:alert] = 'Something went wrong, Try again!'
      render :new
    end
  end

 
  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    authorize! :destroy, @group
    flash[:notice] = if @group.destroy
                       'Category removed successfully'
                     else
                       'Something went wrong'
                     end
    redirect_to root_path
  end

  private
    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :icon)
    end
end
