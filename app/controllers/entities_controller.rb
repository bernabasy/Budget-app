class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: %i[show edit update destroy]


  # GET /entities or /entities.json
  def index
    @current_user = current_user
    @group = Group.find(params[:group_id])
    @group_entities = Group.find(params[:group_id]).group_entities.order(created_at: :desc)
  end

  # GET /entities/new
  def new
    @current_user = current_user
    @group = Group.find_by_id(params[:group_id])
    @available_groups = current_user.groups.reject { |f| @group.entities.include?(f) }
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    @entity = current_user.entities.new(name: params[:name], amount: params[:amount])

    if @entity.save
      @group_entity = GroupEntity.new(group_id: params[:groups], entity_id: @entity.id)
      @group_entity.save
      redirect_to group_entities_path(group_id: params[:groups]), notice: 'Your Transaction is created successfully'
    else
      flash[:alert] = 'Something went wrong, Try again!'
      render :new
    end
  end
end
