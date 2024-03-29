# frozen_string_literal: true
class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: [:add_child, :show, :edit, :update, :destroy]

  # GET /entities
  # GET /entities.json
  def index
    @entities = Entity::Repo.roots
  end

  # GET /entities/1
  # GET /entities/1.json
  def show
    @presenter = @entity.presenter
  end

  # GET /entities/new
  def new
    @entity = Entity::Repo.new
  end

  # GET /entities/1/edit
  def edit
  end

  # POST /entities
  # POST /entities.json
  def create
    @entity = Entity::Repo.new(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_child
    @entity.add_child(entity_params.merge(parent: @entity))
    redirect_to entity_path @entity
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity.destroy
    respond_to do |format|
      format.html do
        redirect_to entity_path @entity.root? ? entities_url : @entity.parent,
                                notice: 'Entity was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity::Repo.find(params[:id])
  end

  # FIXME: need to set manually param obj name instead entity_repo
  def entity_params
    params.require(:entity_repo).permit(
      :parent_id,
      :abstract_id,
      :sort_order,
      :kind_num,
      :name,
      :desc
    )
  end
end
