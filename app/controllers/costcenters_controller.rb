class CostcentersController < ApplicationController
  
  before_action :set_costcenter, only: %i[ show edit update destroy ]

  # GET /costcenters or /costcenters.json
  def index
    @costcenters = policy_scope(Costcenter.includes(:branch, :service).all)
  end

  # GET /costcenters/1 or /costcenters/1.json
  def show
    authorize @costcenter
  end

  # GET /costcenters/new
  def new
    @costcenter = Costcenter.new
    authorize @costcenter
  end

  # GET /costcenters/1/edit
  def edit
    authorize @costcenter
  end

  # POST /costcenters or /costcenters.json
  def create
    @costcenter = Costcenter.new(costcenter_params)
    authorize @costcenter

    respond_to do |format|
      if @costcenter.save
        format.html { redirect_to costcenter_url(@costcenter), notice: "Costcenter was successfully created." }
        format.json { render :show, status: :created, location: @costcenter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @costcenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costcenters/1 or /costcenters/1.json
  def update
    respond_to do |format|
      if @costcenter.update(costcenter_params)
        authorize @costcenter
        format.html { redirect_to costcenter_url(@costcenter), notice: "Costcenter was successfully updated." }
        format.json { render :show, status: :ok, location: @costcenter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @costcenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costcenters/1 or /costcenters/1.json
  def destroy
    @costcenter.destroy
    authorize @costcenter

    respond_to do |format|
      format.html { redirect_to costcenters_url, notice: "Costcenter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costcenter
      @costcenter = Costcenter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def costcenter_params
      params.require(:costcenter).permit(:name, :status, :branch_id, :service_id)
    end
end
