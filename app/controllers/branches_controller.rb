class BranchesController < ApplicationController

  before_action :set_branch, only: %i[ show edit update destroy ]

  # GET /branches or /branches.json
  def index
    @branches = policy_scope(Branch.includes(:company).all)
  end

  # GET /branches/1 or /branches/1.json
  def show
    authorize @branch
  end

  # GET /branches/new
  def new
    @branch = Branch.new
    authorize @branch
  end

  # GET /branches/1/edit
  def edit
    authorize @branch
  end

  # POST /branches or /branches.json
  def create
    @branch = Branch.new(branch_params)
    authorize @branch

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branch_url(@branch)}
        flash[:success] = "Filial salva com sucesso!"
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1 or /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        authorize @branch
        format.html { redirect_to branch_url(@branch)}
        flash[:success] = "Filial alterada com sucesso!"
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1 or /branches/1.json
  def destroy
    @branch.destroy
    authorize @branch

    respond_to do |format|
      format.html { redirect_to branches_url }
      flash[:success] = "Filial excluída com sucesso!"
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def branch_params
      params.require(:branch).permit(:name, :status, :company_id)
    end
end