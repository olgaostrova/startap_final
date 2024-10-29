class Admin::TagTypesController < ApplicationController
  before_action :set_tag_type, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /tag_types or /tag_types.json
  def index
    @tag_types = TagType.all
  end

  # GET /tag_types/1 or /tag_types/1.json
  def show
  end

  # GET /tag_types/new
  def new
    @tag_type = TagType.new
  end

  # GET /tag_types/1/edit
  def edit
  end

  # POST /tag_types or /tag_types.json
  def create
    @tag_type = TagType.new(tag_type_params)

    respond_to do |format|
      if @tag_type.save
        format.html { redirect_to admin_tag_type_url(@tag_type), notice: "Tag type was successfully created." }
        format.json { render :show, status: :created, location: @tag_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_types/1 or /tag_types/1.json
  def update
    respond_to do |format|
      if @tag_type.update(tag_type_params)
        format.html { redirect_to admin_tag_type_url(@tag_type), notice: "Tag type was successfully updated." }
        format.json { render :show, status: :ok, location: @tag_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_types/1 or /tag_types/1.json
  def destroy
    @tag_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_tag_types_path, status: :see_other, notice: "Tag type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_type
      @tag_type = TagType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_type_params
      params.require(:tag_type).permit(:name)
    end
end
